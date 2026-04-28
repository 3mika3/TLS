/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file    app_netxduo.c
  * @brief   NetXDuo applicative file (TCP/TLS Client zu wolfSSL-Server)
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2024 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Includes ------------------------------------------------------------------*/
#include "app_netxduo.h"
#include "wolfssl/ssl.h"
#include "wolfssl/error-ssl.h"
#include "string.h"
#include "wolfssl/wolfcrypt/mem_track.h"
/* Private includes ----------------------------------------------------------*/
#include "nxd_dhcp_client.h"
/* USER CODE BEGIN Includes */
#include "nx_ip.h"

/* Root-CA Certificate */
extern const UCHAR ca_cert_der[];
extern const UINT  ca_cert_der_len;

extern const UCHAR ca_cert_pq_der[];
extern const INT  ca_cert_pq_der_len;

extern const UCHAR ca_cert_dil3_der[];
extern const INT  ca_cert_dil3_der_len;

/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */
/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */

/* wolfSSL Server: 192.168.50.1:11111 */
#define TCP_SERVER_IP_ADDRESS   IP_ADDRESS(192, 168, 50, 1)
#define TCP_SERVER_PORT         11111u
#define TCP_CONNECT_TIMEOUT     (NX_IP_PERIODIC_RATE * 10)   /* 10 Sekunden */

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */
/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
TX_THREAD      NxAppThread;
NX_PACKET_POOL NxAppPool;
NX_IP          NetXDuoEthIpInstance;
TX_SEMAPHORE   DHCPSemaphore;
NX_DHCP        DHCPClient;

ULONG          IpAddress;
ULONG          NetMask;
/* USER CODE BEGIN PV */
extern RNG_HandleTypeDef hrng;

TX_THREAD AppLinkThread;
TX_QUEUE  MsgQueueOne;

/* TLS / Krypto */
//extern const NX_SECURE_TLS_CRYPTO nx_crypto_tls_ciphers;
//static CHAR  crypto_metadata_client[11600];
//UCHAR        tls_packet_buffer[4000];

/* TCP/TLS Client Thread + Socket */
TX_THREAD            AppTCPClientThread;
NX_TCP_SOCKET        TcpClientSocket;
NX_SECURE_TLS_SESSION TlsSession;
NX_SECURE_X509_CERT   RootCaCert;

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
static VOID nx_app_thread_entry (ULONG thread_input);
static VOID ip_address_change_notify_callback(NX_IP *ip_instance, VOID *ptr);
/* USER CODE BEGIN PFP */
static VOID App_Link_Thread_Entry(ULONG thread_input);
static VOID App_TCP_Client_Thread_Entry(ULONG thread_input);

typedef struct {
    NX_TCP_SOCKET* sock;
    UCHAR          buf[16*1024];   // angepasst
    ULONG          len;
    ULONG          pos;
} NETX_WOLFSSL_RECV_CTX;

static NETX_WOLFSSL_RECV_CTX g_recvCtx;


/* USER CODE END PFP */

/**
  * @brief  Application NetXDuo Initialization.
  * @param  memory_ptr: memory pointer
  * @retval int
  */
UINT MX_NetXDuo_Init(VOID *memory_ptr)
{
  UINT ret = NX_SUCCESS;
  TX_BYTE_POOL *byte_pool = (TX_BYTE_POOL*)memory_ptr;
  CHAR *pointer;

  /* initialize WolfSSL Ü/
  wolfSSL_Init();

  /* Initialize the NetXDuo system. */
  nx_system_initialize();

  /* Packet Pool */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       NX_APP_PACKET_POOL_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = nx_packet_pool_create(&NxAppPool, "NetXDuo App Pool",
                              DEFAULT_PAYLOAD_SIZE, pointer,
                              NX_APP_PACKET_POOL_SIZE);
  if (ret != NX_SUCCESS)
  {
    return NX_POOL_ERROR;
  }

  /* IP Instance */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       Nx_IP_INSTANCE_THREAD_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = nx_ip_create(&NetXDuoEthIpInstance, "NetX Ip instance",
                     NX_APP_DEFAULT_IP_ADDRESS, NX_APP_DEFAULT_NET_MASK,
                     &NxAppPool, nx_stm32_eth_driver,
                     pointer, Nx_IP_INSTANCE_THREAD_SIZE,
                     NX_APP_INSTANCE_PRIORITY);
  if (ret != NX_SUCCESS)
  {
    return NX_NOT_SUCCESSFUL;
  }

  /* ARP */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       DEFAULT_ARP_CACHE_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = nx_arp_enable(&NetXDuoEthIpInstance,
                      (VOID *)pointer, DEFAULT_ARP_CACHE_SIZE);
  if (ret != NX_SUCCESS)
  {
    return NX_NOT_SUCCESSFUL;
  }

  /* ICMP */
  ret = nx_icmp_enable(&NetXDuoEthIpInstance);
  if (ret != NX_SUCCESS)
  {
    return NX_NOT_SUCCESSFUL;
  }

  /* TCP */
  ret = nx_tcp_enable(&NetXDuoEthIpInstance);
  if (ret != NX_SUCCESS)
  {
    return NX_NOT_SUCCESSFUL;
  }

  /* UDP (für DHCP) */
  ret = nx_udp_enable(&NetXDuoEthIpInstance);
  if (ret != NX_SUCCESS)
  {
    return NX_NOT_SUCCESSFUL;
  }

  /* Hauptthread */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       NX_APP_THREAD_STACK_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = tx_thread_create(&NxAppThread, "NetXDuo App thread",
                         nx_app_thread_entry , 0,
                         pointer, NX_APP_THREAD_STACK_SIZE,
                         NX_APP_THREAD_PRIORITY, NX_APP_THREAD_PRIORITY,
                         TX_NO_TIME_SLICE, TX_AUTO_START);
  if (ret != TX_SUCCESS)
  {
    return TX_THREAD_ERROR;
  }

  /* DHCP-Client */
  ret = nx_dhcp_create(&DHCPClient, &NetXDuoEthIpInstance, "DHCP Client");
  if (ret != NX_SUCCESS)
  {
    return NX_DHCP_ERROR;
  }

  tx_semaphore_create(&DHCPSemaphore, "DHCP Semaphore", 0);

  /* USER CODE BEGIN MX_NetXDuo_Init */
  printf("TCP/TLS client application (wolfSSL) started..\n");

  /* TCP/TLS Client Thread */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       THREAD_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = tx_thread_create(&AppTCPClientThread, "App TCP/TLS Client Thread",
                         App_TCP_Client_Thread_Entry, 0,
                         pointer, THREAD_MEMORY_SIZE,
                         NX_APP_THREAD_PRIORITY, NX_APP_THREAD_PRIORITY,
                         TX_NO_TIME_SLICE, TX_DONT_START);
  if (ret != TX_SUCCESS)
  {
    return NX_NOT_ENABLED;
  }

  /* Link-Thread */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       2 * DEFAULT_MEMORY_SIZE, TX_NO_WAIT) != TX_SUCCESS)
  {
    return TX_POOL_ERROR;
  }

  ret = tx_thread_create(&AppLinkThread, "App Link Thread",
                         App_Link_Thread_Entry, 0,
                         pointer, 2 * DEFAULT_MEMORY_SIZE,
                         LINK_PRIORITY, LINK_PRIORITY,
                         TX_NO_TIME_SLICE, TX_AUTO_START);
  if (ret != TX_SUCCESS)
  {
    return NX_NOT_ENABLED;
  }

  /* Queue */
  if (tx_byte_allocate(byte_pool, (VOID **) &pointer,
                       APP_QUEUE_SIZE * sizeof(ULONG), TX_NO_WAIT) != TX_SUCCESS)
  {
    ret = TX_POOL_ERROR;
  }

  if (tx_queue_create(&MsgQueueOne, "Message Queue One",
                      TX_1_ULONG, pointer,
                      APP_QUEUE_SIZE * sizeof(ULONG)) != TX_SUCCESS)
  {
    ret = TX_QUEUE_ERROR;
  }

  /* USER CODE END MX_NetXDuo_Init */

  return ret;
}


/*--------------------------------------------- custom */


/* send-Callback: send data to the server */
static int netx_send(WOLFSSL* ssl, char* buf, int sz, void* ctx)
{
    NX_TCP_SOCKET* sock = (NX_TCP_SOCKET*)ctx;
    NX_PACKET* packet;
    UINT status;

    status = nx_packet_allocate(&NxAppPool, &packet, NX_TCP_PACKET, NX_IP_PERIODIC_RATE);
    if (status != NX_SUCCESS)
        return WOLFSSL_CBIO_ERR_WANT_WRITE;

    status = nx_packet_data_append(packet, buf, sz, &NxAppPool, NX_IP_PERIODIC_RATE);
    if (status != NX_SUCCESS)
    {
        nx_packet_release(packet);
        return WOLFSSL_CBIO_ERR_WANT_WRITE;
    }

    status = nx_tcp_socket_send(sock, packet, NX_IP_PERIODIC_RATE * 5);
    if (status != NX_SUCCESS)
    {
        nx_packet_release(packet);
        return WOLFSSL_CBIO_ERR_WANT_WRITE;
    }

    return sz; /* return success */
}


/* recieve-Callback: rcv data from the server */
int netx_recv(WOLFSSL* ssl, char* buf, int sz, void* ctx)
{
    NETX_WOLFSSL_RECV_CTX* rctx = (NETX_WOLFSSL_RECV_CTX*)ctx;
    NX_TCP_SOCKET* sock = rctx->sock;
    UINT status;

    (void)ssl;

    /* is there data in the buffer? */
    if (rctx->pos < rctx->len) {
        ULONG avail  = rctx->len - rctx->pos;
        int   toCopy = (int)((avail < (ULONG)sz) ? avail : (ULONG)sz);

        memcpy(buf, &rctx->buf[rctx->pos], toCopy);
        rctx->pos += toCopy;

        if (rctx->pos >= rctx->len) {
            rctx->pos = 0;
            rctx->len = 0;
        }

        return toCopy;
    }

    /* 2. get a new packet */
    NX_PACKET* packet;
    status = nx_tcp_socket_receive(sock, &packet, NX_IP_PERIODIC_RATE * 5);
    if (status != NX_SUCCESS) {
        return WOLFSSL_CBIO_ERR_WANT_READ;
    }

    /* checks length */
    ULONG pkt_len = 0;
    nx_packet_length_get(packet, &pkt_len);

    if (pkt_len > sizeof(rctx->buf)) {
        nx_packet_release(packet);
        printf("ERROR: TLS packet too large (%lu bytes) for recv buffer (%u)\r\n",
               pkt_len, (unsigned)sizeof(rctx->buf));
        return WOLFSSL_CBIO_ERR_GENERAL;
    }

    ULONG bytes_read = 0;
    nx_packet_data_retrieve(packet, rctx->buf, &bytes_read);
    nx_packet_release(packet);

    rctx->pos = 0;
    rctx->len = bytes_read;

    if (rctx->len == 0) {
        return WOLFSSL_CBIO_ERR_WANT_READ;
    }

    /* 3. copy from buffer exactly as much is requested */
    int toCopy = (int)((rctx->len < (ULONG)sz) ? rctx->len : (ULONG)sz);
    memcpy(buf, &rctx->buf[rctx->pos], toCopy);
    rctx->pos += toCopy;

    if (rctx->pos >= rctx->len) {
        rctx->pos = 0;
        rctx->len = 0;
    }

    return toCopy;
}





/**
* @brief  IP address change callback.
*/
static VOID ip_address_change_notify_callback(NX_IP *ip_instance, VOID *ptr)
{
  /* USER CODE BEGIN ip_address_change_notify_callback */
  NX_PARAMETER_NOT_USED(ip_instance);
  NX_PARAMETER_NOT_USED(ptr);

  if (nx_ip_address_get(&NetXDuoEthIpInstance, &IpAddress, &NetMask) != NX_SUCCESS)
  {
    Error_Handler();
  }
  if (IpAddress != NULL_ADDRESS)
  {
    tx_semaphore_put(&DHCPSemaphore);
  }
  /* USER CODE END ip_address_change_notify_callback */
}

/**
* @brief  Main thread entry.
*/
static VOID nx_app_thread_entry (ULONG thread_input)
{
  UINT ret = NX_SUCCESS;
  NX_PARAMETER_NOT_USED(thread_input);

  /*  Register callback for ip change */
  ret = nx_ip_address_change_notify(&NetXDuoEthIpInstance,
                                    ip_address_change_notify_callback,
                                    NULL);
  if (ret != NX_SUCCESS)
  {
    Error_Handler();
  }

  /* DHCP start */
  ret = nx_dhcp_start(&DHCPClient);
  if (ret != NX_SUCCESS)
  {
    Error_Handler();
  }

  printf("Looking for DHCP server ..\n");

  /* waiting for an ip */
  if (tx_semaphore_get(&DHCPSemaphore, TX_WAIT_FOREVER) != TX_SUCCESS)
  {
    Error_Handler();
  }

  PRINT_IP_ADDRESS(IpAddress);

  /* TCP/TLS-Client-Thread start */
  tx_thread_resume(&AppTCPClientThread);

  /* App-Thread is finished */
  tx_thread_relinquish();
}


/* USER CODE BEGIN 1 */

/**
* @brief  TCP/TLS Client thread entry.
*         establishes a TLS-connection to 192.168.50.1:11111
*/
static VOID App_TCP_Client_Thread_Entry(ULONG thread_input)
{
  UINT  status;
  ULONG server_ip = TCP_SERVER_IP_ADDRESS;

  NX_PARAMETER_NOT_USED(thread_input);

  printf("TCP/TLS client thread started. Connecting to %lu.%lu.%lu.%lu:%u\n",
         (server_ip >> 24) & 0xFF,
         (server_ip >> 16) & 0xFF,
         (server_ip >>  8) & 0xFF,
         (server_ip      ) & 0xFF,
         (unsigned int)TCP_SERVER_PORT);

  /* 1. TCP Socket create */
  status = nx_tcp_socket_create(&NetXDuoEthIpInstance,
                                &TcpClientSocket,
                                "TCP Client Socket",
                                NX_IP_NORMAL,
                                NX_DONT_FRAGMENT,
                                NX_IP_TIME_TO_LIVE,
                                1460,
                                NX_NULL,
                                NX_NULL);
  if (status != NX_SUCCESS)
  {
    printf("nx_tcp_socket_create failed: 0x%08X\n", status);
    Error_Handler();
  }

  /* 2. bind a local port */
  status = nx_tcp_client_socket_bind(&TcpClientSocket,
                                     NX_ANY_PORT,
                                     TX_WAIT_FOREVER);
  if (status != NX_SUCCESS)
  {
    printf("nx_tcp_client_socket_bind failed: 0x%08X\n", status);
    nx_tcp_socket_delete(&TcpClientSocket);
    Error_Handler();
  }

  /* 3. TCP Connect (Handshake) */
  status = nx_tcp_client_socket_connect(&TcpClientSocket,
                                        server_ip,
                                        TCP_SERVER_PORT,
                                        TCP_CONNECT_TIMEOUT);
  if (status != NX_SUCCESS)
  {
    printf("TCP connect failed: 0x%08X\n", status);
    nx_tcp_client_socket_unbind(&TcpClientSocket);
    nx_tcp_socket_delete(&TcpClientSocket);
    Error_Handler();
  }

  g_recvCtx.sock = &TcpClientSocket;
  g_recvCtx.len  = 0;
  g_recvCtx.pos  = 0;


  printf("TCP handshake OK, connected. Starting TLS handshake...\n");


  /* === wolfSSL: Kontext + Session einrichten === */

    WOLFSSL_CTX* ctx = NULL;
    WOLFSSL*     ssl = NULL;

    /* TLS 1.3 Client Methode (zu deinem Server passend) */
    ctx = wolfSSL_CTX_new(wolfTLSv1_3_client_method());
    if (ctx == NULL)
    {
        printf("wolfSSL_CTX_new failed\n");
        goto tls_error;
    }




    static signed int groups[] = { WOLFSSL_X25519MLKEM768 };
    wolfSSL_CTX_set_groups(ctx, groups, 1);

    status = wolfSSL_CTX_load_verify_buffer(ctx,
                                         ca_cert_der,
                                         ca_cert_der_len,
                                         WOLFSSL_FILETYPE_ASN1);   /* DER */
    if (status != SSL_SUCCESS)
    {
        printf("wolfSSL_CTX_load_verify_buffer failed, ret = %d\n", status);
        goto tls_error;
    }



//    static signed int groups[] = { WOLFSSL_ML_KEM_1024 };
//    wolfSSL_CTX_set_groups(ctx, groups, 1);
//
//
//    status = wolfSSL_CTX_load_verify_buffer(ctx,
//                                         ca_cert_pq_der,
//                                         ca_cert_pq_der_len,
//                                         WOLFSSL_FILETYPE_ASN1);   /* DER */
//    if (status != SSL_SUCCESS)
//    {
//        printf("wolfSSL_CTX_load_verify_buffer failed, ret = %d\n", status);
//        goto tls_error;
//    }


//    static signed int groups[] = { WOLFSSL_ECC_SECP384R1 };
//    wolfSSL_CTX_set_groups(ctx, groups, 1);
//
//
//    status = wolfSSL_CTX_load_verify_buffer(ctx,
//                                         ca_cert_pq_der,
//                                         ca_cert_pq_der_len,
//                                         WOLFSSL_FILETYPE_ASN1);   /* DER */
//    if (status != SSL_SUCCESS)
//    {
//        printf("wolfSSL_CTX_load_verify_buffer failed, ret = %d\n", status);
//        goto tls_error;
//    }


//    status = wolfSSL_CTX_load_verify_buffer(ctx,
//                                            ca_cert_der,
//                                            ca_cert_der_len,
//                                            WOLFSSL_FILETYPE_ASN1);   /* DER */
//    if (status != SSL_SUCCESS)
//    {
//        printf("wolfSSL_CTX_load_verify_buffer failed, ret = %d\n", status);
//        goto tls_error;
//    }



//    static signed int groups[] = { WOLFSSL_ML_KEM_1024 };
//    wolfSSL_CTX_set_groups(ctx, groups, 1);
//
//
//    status = wolfSSL_CTX_load_verify_buffer(ctx,
//    								     ca_cert_dil3_der,
//										 ca_cert_dil3_der_len,
//                                         WOLFSSL_FILETYPE_ASN1);   /* DER */
//    if (status != SSL_SUCCESS)
//    {
//        printf("wolfSSL_CTX_load_verify_buffer failed, ret = %d\n", status);
//        goto tls_error;
//    }




//    wolfSSL_CTX_set_verify(ctx, SSL_VERIFY_NONE, NULL);



    /* Set IO-Callbacks for NetX */
    wolfSSL_SetIORecv(ctx, netx_recv);
    wolfSSL_SetIOSend(ctx, netx_send);


    /* Create Session */
    ssl = wolfSSL_new(ctx);
    if (ssl == NULL)
    {
        printf("wolfSSL_new failed\n");
        goto tls_error;
    }


    wolfSSL_SetIOReadCtx(ssl, &g_recvCtx);
    wolfSSL_SetIOWriteCtx(ssl, &TcpClientSocket);


    uint32_t a = TimMeasure_NowUs();
    HAL_Delay(100);
    uint32_t b = TimMeasure_NowUs();
    printf("TIM2 delta = %lu ticks (sollte ~100000 sein)\r\n", (unsigned long)(b-a));



//    InitMemoryTracker();
//
//    printf("Memory before TLS handshake:\n");
//    ShowMemoryTracker();

    /* TLS Handshake */
    CoreDebug->DEMCR |= CoreDebug_DEMCR_TRCENA_Msk;
    DWT->CYCCNT = 0;
    DWT->CTRL |= DWT_CTRL_CYCCNTENA_Msk;
    uint32_t start_cycles = DWT->CYCCNT;

    uint32_t start = TimMeasure_NowUs();


    status = wolfSSL_connect(ssl);
    if (status != SSL_SUCCESS)
    {
        int err = wolfSSL_get_error(ssl, status);
        char err_buf[80];
        wolfSSL_ERR_error_string(err, err_buf);

        printf("wolfSSL_connect failed, ret = %d, err = %d (%s)\n", status, err, err_buf);
        goto tls_error;
    }

//    printf("Memory after TLS handshake:\n");
//    ShowMemoryTracker();

    uint32_t elapsed_cycles = DWT->CYCCNT - start_cycles;
    uint32_t cpu_hz = HAL_RCC_GetHCLKFreq();
    uint32_t time_us = elapsed_cycles / (cpu_hz / 1000000UL);

    uint32_t elapsed = TimMeasure_NowUs() - start;

    printf("TLS handshake OK – gesicherte Verbindung zum wolfSSL-Server steht. %lu us (%lu cycles)\r\n",
       (unsigned long)time_us,
       (unsigned long)elapsed_cycles);

    printf("elapsed = %lu us\r\n", (unsigned long)elapsed);




    /* Send a encrypted message */
    {
        const char msg[] = "Hello from STM32 over wolfSSL\r\n";
        status = wolfSSL_write(ssl, msg, sizeof(msg)-1);
        if (status <= 0)
        {
            int err = wolfSSL_get_error(ssl, status);
            printf("wolfSSL_write failed, err = %d\n", status, err);
        }
        else
        {
            printf("Sent %d bytes over TLS\n", status);
        }
    }

    /* Close Session */
    wolfSSL_shutdown(ssl);
    wolfSSL_free(ssl);
    wolfSSL_CTX_free(ctx);






//  /* 4. TLS initialisieren */
//  nx_secure_tls_initialize();
//
//  status = nx_secure_tls_session_create(&TlsSession,
//                                        &nx_crypto_tls_ciphers,
//                                        crypto_metadata_client,
//                                        sizeof(crypto_metadata_client));
//  if (status != NX_SUCCESS)
//  {
//    printf("nx_secure_tls_session_create failed: 0x%08X\n", status);
//    Error_Handler();
//  }
//
//  status = nx_secure_tls_session_protocol_version_override(
//		        &TlsSession,
//                NX_SECURE_TLS_VERSION_TLS_1_2);
//  if (status != NX_SUCCESS)
//  {
//    printf("TLS version override failed: 0x%08X\n", status);
//    Error_Handler();
//  }
//
//
//
//  const NX_SECURE_TLS_CIPHERSUITE_INFO *table =
//                nx_crypto_tls_ciphers.nx_secure_tls_ciphersuite_lookup_table;
//        UINT count = nx_crypto_tls_ciphers.nx_secure_tls_ciphersuite_lookup_table_size;
//        UINT i;
//
//        printf("NetX TLS Cipher Suites (%u Eintraege):\r\n", count);
//        for (i = 0; i < count; i++)
//        {
//            printf("  Cipher %u: 0x%04X\r\n",
//                   i,
//                   table[i].nx_secure_tls_ciphersuite);
//        }
//
//
//
//
//  /* TLS Packet Buffer setzen */
//  status = nx_secure_tls_session_packet_buffer_set(&TlsSession,
//                                                   tls_packet_buffer,
//                                                   sizeof(tls_packet_buffer));
//  if (status != NX_SUCCESS)
//  {
//    printf("nx_secure_tls_session_packet_buffer_set failed: 0x%08X\n", status);
//    Error_Handler();
//  }
//
//  /* Root-CA Zertifikat (wolfSSL Root) initialisieren */
//  status = nx_secure_x509_certificate_initialize(&RootCaCert,
//                                                 (UCHAR*)ca_cert_der,
//												 ca_cert_der_len,
//                                                 NX_NULL, 0,
//                                                 NULL, 0,
//                                                 NX_SECURE_X509_KEY_TYPE_NONE);
//  if (status != NX_SUCCESS)
//  {
//    printf("nx_secure_x509_certificate_initialize failed: 0x%08X\n", status);
//    Error_Handler();
//  }
//
//  /* Root-CA in den Truststore */
//  status = nx_secure_tls_trusted_certificate_add(&TlsSession, &RootCaCert);
//  if (status != NX_SUCCESS)
//  {
//    printf("nx_secure_tls_trusted_certificate_add failed: 0x%08X\n", status);
//    Error_Handler();
//  }
//
//  /* 5. TLS Handshake */
//  status = nx_secure_tls_session_start(&TlsSession,
//                                       &TcpClientSocket,
//                                       TX_WAIT_FOREVER);
//  if (status != NX_SUCCESS)
//  {
//    printf("TLS handshake failed: 0x%08X\n", status);
//
//    nx_secure_tls_session_end(&TlsSession, NX_NO_WAIT);
//    nx_secure_tls_session_delete(&TlsSession);
//
//    nx_tcp_socket_disconnect(&TcpClientSocket, NX_IP_PERIODIC_RATE * 5);
//    nx_tcp_client_socket_unbind(&TcpClientSocket);
//    nx_tcp_socket_delete(&TcpClientSocket);
//    Error_Handler();
//  }
//
//  printf("TLS handshake OK – gesicherte Verbindung zum wolfSSL-Server steht.\n");
//
//  /* === Hier könntest du Daten per TLS senden:
//     z.B.:
//     const CHAR msg[] = "Hello from STM32\r\n";
//     nx_secure_tls_session_send(&TlsSession, (UCHAR*)msg, sizeof(msg)-1, &status);
//  */
//
//  /* 6. TLS Session sauber beenden */
//  status = nx_secure_tls_session_end(&TlsSession,
//                                     NX_IP_PERIODIC_RATE * 5);
//  if (status != NX_SUCCESS)
//  {
//    printf("nx_secure_tls_session_end failed: 0x%08X\n", status);
//  }
//  nx_secure_tls_session_delete(&TlsSession);

  /* 7. TCP-Verbindung schließen */

  ULONG state, ip, port;
  ULONG win, dummy;

  nx_tcp_socket_info_get(&TcpClientSocket,
		                  &dummy, &dummy,
		                  &dummy, &dummy,
		                  &dummy,
		                  &dummy,
		                  &dummy,
		                  &state,
		                  &dummy,
		                  &dummy,
		                  &dummy);



  if (state == NX_TCP_ESTABLISHED ||
      state == NX_TCP_CLOSE_WAIT)
  {
      status = nx_tcp_socket_disconnect(&TcpClientSocket,
                                        NX_IP_PERIODIC_RATE * 5);

      if (status != NX_SUCCESS && status != NX_DISCONNECT_FAILED)
      {
          printf("Disconnect error: 0x%08X\r\n", status);
      }
  }
  else
  {
      printf("Socket already closed (state=0x%lX), skipping disconnect\r\n", state);
  }


  nx_tcp_client_socket_unbind(&TcpClientSocket);
  nx_tcp_socket_delete(&TcpClientSocket);

  printf("TCP/TLS client done.\n");

  while (1)
  {
    tx_thread_sleep(NX_IP_PERIODIC_RATE);
  }

  tls_error:

    if (ssl)
        wolfSSL_free(ssl);
    if (ctx)
        wolfSSL_CTX_free(ctx);

    nx_tcp_socket_disconnect(&TcpClientSocket, NX_IP_PERIODIC_RATE * 5);
    nx_tcp_client_socket_unbind(&TcpClientSocket);
    nx_tcp_socket_delete(&TcpClientSocket);

    printf("TLS error, cleaned up and stopping client thread.\n");
    while (1)
    {
      tx_thread_sleep(NX_IP_PERIODIC_RATE);
    }

}

/**
* @brief  Link thread entry
*/
static VOID App_Link_Thread_Entry(ULONG thread_input)
{
  ULONG actual_status;
  UINT linkdown = 0, status;

  NX_PARAMETER_NOT_USED(thread_input);

  while (1)
  {
    status = nx_ip_interface_status_check(&NetXDuoEthIpInstance, 0,
                                          NX_IP_LINK_ENABLED,
                                          &actual_status, 10);

    if (status == NX_SUCCESS)
    {
      if (linkdown == 1)
      {
        linkdown = 0;

        printf("The network cable is connected.\n");

        nx_ip_driver_direct_command(&NetXDuoEthIpInstance,
                                    NX_LINK_ENABLE,
                                    &actual_status);

        status = nx_ip_interface_status_check(&NetXDuoEthIpInstance, 0,
                                              NX_IP_ADDRESS_RESOLVED,
                                              &actual_status, 10);
        if (status == NX_SUCCESS)
        {
          nx_dhcp_stop(&DHCPClient);
          nx_dhcp_reinitialize(&DHCPClient);
          nx_dhcp_start(&DHCPClient);

          if (tx_semaphore_get(&DHCPSemaphore, TX_WAIT_FOREVER) != TX_SUCCESS)
          {
            Error_Handler();
          }

          PRINT_IP_ADDRESS(IpAddress);
        }
        else
        {
          nx_dhcp_client_update_time_remaining(&DHCPClient, 0);
        }
      }
    }
    else
    {
      if (linkdown == 0)
      {
        linkdown = 1;
        printf("The network cable is not connected.\n");
        nx_ip_driver_direct_command(&NetXDuoEthIpInstance,
                                    NX_LINK_DISABLE,
                                    &actual_status);
      }
    }

    tx_thread_sleep(NX_APP_CABLE_CONNECTION_CHECK_PERIOD);
  }
}

/* USER CODE END 1 */

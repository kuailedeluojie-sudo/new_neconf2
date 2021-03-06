/**
 * @file config.h
 * @author Michal Vasko <mvasko@cesnet.cz>
 * @brief Various configuration constants for netopeer2-server
 *
 * Copyright (c) 2019 CESNET, z.s.p.o.
 *
 * This source code is licensed under BSD 3-Clause License (the "License").
 * You may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://opensource.org/licenses/BSD-3-Clause
 */

#ifndef NP2SRV_CONFIG_H_
#define NP2SRV_CONFIG_H_

/** @brief Netopeer2 Server version */
#define NP2SRV_VERSION "1.1.34"

/** @brief Netopeer2 Server PID file path
 * The default path /var/run/netopeer2-server.pid follows
 * the Filesystem Hierarchy Standard
 */
#define NP2SRV_PID_FILE_PATH "/var/run/netopeer2-server.pid"

/** @brief Netopeer2 Server UNIX socket file path
 * The default path /var/run/netopeer2-server.sock follows
 * the Filesystem Hierarchy Standard
 */
#define NP2SRV_UNIX_SOCK_PATH "/var/run/netopeer2-server.sock"

/** @brief Maximum number of threads handling session requests
 */
#ifndef NP2SRV_THREAD_COUNT
#   define NP2SRV_THREAD_COUNT 5
#endif

/** @brief NACM recovery session UID
 */
#define NP2SRV_NACM_RECOVERY_UID 0

/** @brief Timeout for all sysrepo operations (ms)  with a custom timeout, 0 is the sysrepo default
 */
#define NP2SRV_SYSREPO_TIMEOUT (5 * 1000)

/** @brief Whether to wait on sysrepo data change calls for all the events to be processed
 */
#define NP2SRV_DATA_CHANGE_WAIT 0

/** @brief Timeout for sysrepo operations (ms) handle RPC, 0 is the sysrepo default
 */
#define NP2SRV_RPC_TIMEOUT (6 * 1000)

/** @brief Timeout for nc_ps_poll() call
 */
#define NP2SRV_POLL_IO_TIMEOUT 10

/** @brief Starting allocated length for a message
 */
#define NP2SRV_MSG_LEN_START 128

/** @brief Timeout for sending notifications (ms)
 * Should never be needed to be increased, libnetconf2
 * handles concurrency well.
 */
#define NP2SRV_NOTIF_SEND_TIMEOUT 1000

/** @brief Timeout for PS structure accessing in
 * case there is too much contention (ms).
 */
#define NP2SRV_PS_BACKOFF_SLEEP 200

/** @brief URL capability support
 */
/* #undef NP2SRV_URL_CAPAB */

/** @brief availability of atomic variables
 */
/* #undef HAVE_STDATOMIC */
#ifdef HAVE_STDATOMIC
# include <stdatomic.h>

# define ATOMIC_T atomic_uint_fast32_t

# define ATOMIC_STORE_FENCE(var, x) atomic_store_explicit(&(var), x, memory_order_release)
# define ATOMIC_INC_FENCE(var) atomic_fetch_add_explicit(&(var), 1, memory_order_release)
# define ATOMIC_DEC_FENCE(var) atomic_fetch_sub_explicit(&(var), 1, memory_order_release)
# define ATOMIC_LOAD_FENCE(var) atomic_load_explicit(&(var), memory_order_acquire)

# define ATOMIC_STORE_RELAXED(var, x) atomic_store_explicit(&(var), x, memory_order_relaxed)
# define ATOMIC_LOAD_RELAXED(var) atomic_load_explicit(&(var), memory_order_relaxed)
#else
# define ATOMIC_T uint32_t

# define ATOMIC_STORE_FENCE(var, x) ((var) = (x))
# define ATOMIC_INC_FENCE(var) __sync_add_and_fetch(&(var), 1)
# define ATOMIC_DEC_FENCE(var) __sync_sub_and_fetch(&(var), 1)
# define ATOMIC_LOAD_FENCE(var) (var)

# define ATOMIC_STORE_RELAXED(var, x) ATOMIC_STORE_FENCE(var, x)
# define ATOMIC_LOAD_RELAXED(var) ATOMIC_LOAD_FENCE(var)
#endif

/** @brief unused compiler attribute
 */
#define UNUSED(x) UNUSED_ ## x __attribute__((__unused__))

#endif /* NP2SRV_CONFIG_H_ */

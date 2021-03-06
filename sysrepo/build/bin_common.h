/**
 * @file bin_common.h
 * @author Michal Vasko <mvasko@cesnet.cz>
 * @brief common binaries header
 *
 * @copyright
 * Copyright 2018 Deutsche Telekom AG.
 * Copyright 2018 - 2019 CESNET, z.s.p.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#ifndef _BIN_COMMON_H
#define _BIN_COMMON_H

/** sysrepo version */
#define SR_VERSION "1.4.66"

/** sysrepo soversion */
#define SR_SOVERSION "5.5.8"

/** sysrepo-plugind working directory. */
#define SRPD_WORK_DIR "/"

/** sysrepo-plugind plugins directory */
#define SRPD_PLUGINS_PATH "/opt/sysrepo/lib/sysrepo/plugins"

/** whether mkstemps is found on the system */
#define SR_HAVE_MKSTEMPS

#endif

cmake_minimum_required(VERSION 3.14)

project(fustl C)
#CMAKE_CURRENT_SOURCE_DIR CMakeLists.txt所在的当前路径
set(ZLIB_LIBRARY ${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/zlib/debug/output)

set(OPENSSL_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/openssl/debug/output)
set(OPENSSL_LIB  ${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/openssl/debug/output/lib/libssl.so)
set(OPENSSLCRYPTO_LIB  ${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/openssl/debug/output/lib/libcrypto.so)
find_package(OpenSSL REQUIRED)
link_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/openssl/debug/output/lib/)

LINK_LIBRARIES(${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/zlib/debug/output/libz.so)
set(ZLIB_INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib_src/zlib-1.2.11)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib_src/zlib-1.2.11)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../../../netconf2/lib/zlib/debug/output)

add_subdirectory(
  ${CMAKE_CURRENT_SOURCE_DIR}/..
  output
)

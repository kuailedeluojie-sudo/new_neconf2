#!/bin/sh
export CC=arm-linux-gcc
export CXX=arm-linux-g++
rm build -rf
mkdir -p build
cd build
cmake ..  -DCMAKE_INSTALL_PREFIX=/opt/libnetconf2/ -DOPENSSL_ROOT_DIR=/home/mo/share/netconf2/lib/openssl/debug/output/lib/ -DOPENSSL_LIBRARIES=/home/mo/share/netconf2/lib/openssl/debug/output/lib/libssl.a -DOPENSSL_INCLUDE_DIR=/home/mo/share/netconf2/lib/openssl/debug/output/include -DLIBSSH_INCLUDE_DIRS=/home/mo/share/netconf2/lib/libssh/_install/include -DLIBSSH_LIBRARIES=/home/mo/share/netconf2/lib/libssh/_install/lib/libssh.so.4.8.1 -DLIBYANG_INCLUDE_DIRS=/opt/libyang/include -DLIBYANG_LIBRARIES=/opt/libyang/lib/libyang.so.1.8.4
make -j8
make install

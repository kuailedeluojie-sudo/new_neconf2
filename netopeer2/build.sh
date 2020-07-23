#!/bin/bash
export CC=arm-linux-gcc
export CXX=arm-linux-g++
rm build -rf
mkdir build
cd build
#之前安装软件的位置为/home/mo/share/netconf2/lib/netopeer2/_install
#现在的安装位置换成 /opt/netopeer2/_install
cmake ..  -DCMAKE_INSTALL_PREFIX=/home/mo/share/netconf2_new/netopeer2/_install -DLIBYANG_INCLUDE_DIRS=/home/mo/share/netconf2_new/libyang/_install/include -DLIBYANG_LIBRARIES=/home/mo/share/netconf2_new/libyang/_install/lib/libyang.so.1.8.4  -DOPENSSL_ROOT_DIR=/home/mo/share/netconf2/lib/openssl/debug/output/lib/ -DOPENSSL_LIBRARIES=/home/mo/share/netconf2/lib/openssl/debug/output/lib/libssl.a -DLIBCRYPTO_LIBRARIES=/home/mo/share/netconf2/lib/openssl/debug/output/lib/libcrypto.so.1.1  -DOPENSSL_INCLUDE_DIRS=/home/mo/share/netconf2/lib/openssl/debug/output/include -DLIBCRYPTO_INCLUDE_DIRS=/home/mo/share/netconf2/lib/libnetconf2/_install/include -DLIBSSH_INCLUDE_DIRS=/home/mo/share/netconf2/lib/libssh/_install/include -DLIBSSH_LIBRARIES=/home/mo/share/netconf2/lib/libssh/_install/lib/libssh.so.4.8.1 -DSYSREPO_LIBRARIES=/home/mo/share/netconf2_new/sysrepo/_install/lib/libsysrepo.so.5.5.8 -DSYSREPO_INCLUDE_DIRS=/home/mo/share/netconf2_new/sysrepo/_install/include -DLIBNETCONF2_LIBRARIES=/home/mo/share/netconf2_new/libnetconf2/_install/lib/libnetconf2.so.1.3.5 -DLIBNETCONF2_INCLUDE_DIRS=/home/mo/share/netconf2_new/libnetconf2/_install/include 
#/home/mo/share/netconf2/lib/libnetconf2/_install/lib/libnetconf2.so.1.3.5 /home/mo/share/netconf2/lib/libssh/_install/lib/libssh.so.4.8.1
make 
make install

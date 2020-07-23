#!/bin/bash
export CC=arm-linux-gcc
export CXX=arm-linux-g++
rm build -rf
mkdir build
cd build
#之前安装在/home/mo/share/netconf2/lib/sysrepo/_install
#现在安装到/opt/sysrepo/_install
cmake ..  -DCMAKE_INSTALL_PREFIX=/opt/sysrepo/ -DLIBYANG_INCLUDE_DIRS=/opt/libyang/include -DLIBYANG_LIBRARIES=/opt/libyang/lib/libyang.so.1.8.4  -DOPENSSL_ROOT_DIR=/home/mo/share/netconf2/lib/openssl/debug/output/lib/ -DOPENSSL_LIBRARIES=/home/mo/share/netconf2/lib/openssl/debug/output/lib/libssl.a -DOPENSSL_INCLUDE_DIR=/home/mo/share/netconf2/lib/openssl/debug/output/include -DLIBSSH_INCLUDE_DIRS=/home/mo/share/netconf2/lib/libssh/_install/include -DLIBSSH_LIBRARIES=/home/mo/share/netconf2/lib/libssh/_install/lib/libssh.so.4.8.1 
make -j8
make install

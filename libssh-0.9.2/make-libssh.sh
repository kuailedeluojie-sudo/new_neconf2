#!/bin/sh
export CC=arm-linux-gcc
export CXX=arm-linux-g++
#export CC=arm-linux-gnueabihf-gcc
#export CXX=arm-linux-gnueabihf-g++
cd lib/
mkdir -p debug
cd debug
rm -rf *
cmake .. -DZLIB_INCLUDE_DIR=/home/mo/share/zlib-1.2.11/_install/include  -DCMAKE_INSTALL_PREFIX=/opt/libssh
make
make install

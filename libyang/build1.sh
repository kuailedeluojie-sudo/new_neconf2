export CC=arm-linux-gcc
export CXX=arm-linux-g++
rm build/* -rf
mkdir build
cd build
#之前安装的位置是在/home/mo/share/netconf2/lib/libyang/_install
#现在的位置改为/opt/libyang/_install
cmake .. -DPCRE_LIBRARIES=/home/mo/share/netconf2/lib_src/pcre-8.44/_install/lib/libpcre.a -DPCRE_INCLUDE_DIRS=/home/mo/share/pcre-8.44/_install/include -DCMAKE_INSTALL_PREFIX=/opt/libyang/_install
#cmake .. -DPCRE_LIBRARIES=/home/mo/share/netconf2/lib_src/pcre-8.44/_install/lib/libpcre.a -DPCRE_INCLUDE_DIRS=/home/mo/share/pcre-8.44/_install/include -DCMAKE_INSTALL_PREFIX=/opt/libyang/_install
#export CC=arm-linux-gnueabihf-gcc
#export CXX=arm-linux-gnueabihf-g++
make
make install

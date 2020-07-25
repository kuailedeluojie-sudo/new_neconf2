cd ./libyang
./build.sh
cd ../sysrepo
./build.sh
cd ../libnetconf2
./build.sh
cd ../netopeer2
./build.sh
cd ..
rm ./bin -rf
mkdir bin
rm ./lib -rf
mkdir lib

cp  */*/bin/* ./bin/
cp  */*/lib/* ./lib/


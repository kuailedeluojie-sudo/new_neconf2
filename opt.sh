cd ./libyang
./build1.sh
cd ../sysrepo
./build1.sh
cd ../libnetconf2
./build1.sh
cd ../netopeer2
./build1.sh
cd ..
rm all -rf
mkdir all
cp /opt/* ./all -rf

#主要是使用ssh 0.9.2版本
#echo rm /opt/* -rf
#rm /opt/* -rf
echo  cd ./libyang
cd ./libyang
echo ./build2.sh
./build2.sh
echo cd ../sysrepo
cd ../sysrepo
echo ./build2.sh
./build2.sh
echo $PWD
echo cd ./examples
cd ./examples
echo $PWD
echo ./build2.sh
./build2.sh
echo $PWD
echo cd ../
cd ../
echo cd ../libnetconf2
cd ../libnetconf2
echo ./build2.sh
./build2.sh
echo $PWD


echo cd ../netopeer2
cd ../netopeer2
echo ./build2.sh
./build2.sh
#echo cd ..
#cd ..
#echo rm all -rf
#rm all -rf
#echo mkdir all
#mkdir all
#echo cp /opt/* ./all -rf
#cp /opt/* ./all -rf
#echo rm lib -rf
#rm lib -rf
#echo mkdir lib
#mkdir lib
#echo cp /opt/*/lib ./lib -rf
#cp /opt/*/lib/* ./lib -rf

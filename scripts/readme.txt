#编译好netopeer2的软件后，服务器软件就靠这三个脚本才能正常运行起来
#CMakeLists.txt中用到的make install就有用到这几个脚本
setup.sh 
merge_hostkey.sh 
merge_config.sh
安装完成后在/dev/shm 目录下面创建了很多共享内存文件
现在的步骤是先把共享文件拷贝到/dev/shm目录下面，然后打开
sysrepo的守护进程
再执行脚本进行设置
再打开netopeer2-server
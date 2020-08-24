# new_neconf2
新的netconf2
## 如何在普通的计算机上面安装这个软件
sudo apt-get install git cmake g++ libpcre3-dev net-tools openssh-server libcurl4-openssl-dev pkg-config flex bison devscripts debhelper rpm doxygen graphviz

mkdir cesnet

sudo apt-get install zlib1g-dev libssl-dev libgcrypt-dev

cd ~/cesnet/ <br>
git clone http://git.libssh.org/projects/libssh.git <br>
cd ~/cesnet/libssh <br>
git checkout libssh-0.9.2 <br>
mkdir build; cd build <br>
#cmake -D CMAKE_BUILD_TYPE:String="Release" -D WITH_GCRYPT=yes -D WITH_PCAP=yes -D WITH_SFTP=yes -D WITH_ZLIB=yes .. <br>
cmake -D CMAKE_BUILD_TYPE:String="Release" .. <br>
make <br>
sudo make install <br>


cd ~/cesnet/ <br>
git clone https://github.com/CESNET/libyang.git <br>
cd ~/cesnet/libyang; mkdir build; cd build <br>
cmake -D CMAKE_BUILD_TYPE:String="Release" .. <br>
make <br>
sudo make install <br>


cd ~/cesnet/ <br>
git clone https://github.com/CESNET/libnetconf2.git <br>
cd ~/cesnet/libnetconf2; mkdir build; cd build <br>
cmake -D CMAKE_BUILD_TYPE:String="Release" .. <br>
make <br>
sudo make install <br>


cd ~/cesnet/<br>
git clone https://github.com/sysrepo/sysrepo.git <br>
cd ~/cesnet/sysrepo; mkdir build; cd build <br>
cmake -D CMAKE_BUILD_TYPE:String="Release" .. <br>
make <br>
sudo make install <br>


cd ~/cesnet/ <br>
git clone https://github.com/CESNET/Netopeer2.git <br>
cd ~/cesnet/Netopeer2; mkdir build; cd build <br>
cmake -D CMAKE_BUILD_TYPE:String="Release" .. <br>
make <br>
sudo ldconfig <br>
sudo make install <br>
## NETCONF的好处
NETCONF协议由XML编码，以SSH加密，采用TCP连接，体现出更好的安全性和可靠性。<br>
NETCONF认为网络的模型数据可以分为两大类，即状态数据和配置数据。<br>
状态数据仅能查询。<br>
配置数据则是指由用户（以某种方式）配置到server上的数据。<br>
开放但规范的内容层netconf的精髓所在。其开放体现在netconf协议本身没有对内容层的数据结构做任何的限定。<br>
而其规范则体现再其内容层需要yang语言对数据进行建模。<br>
其内容层未指定具体的数据结构，而是指定了一套建模语言yang.也就是说使用yang定义的数据模型，均可以做为netconf的内容层。<br>
所以扩展对netconf来说就是不断的增加和修改yang文件而已。<br>
简直是降维打击。<br>
### YANG模型是什么？
YANG模型是一种数据建模语言，用来建模NETCONF协议,NETCONF远端过程调用(RPCs)，和NETCONF通知(notification)操作的配置数据和状态数据.<br>
YANG建模NETCONF协议的操作和内容层（RFC4741,Section1.1）<br>

#### YANG模型特性
![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-25.png)
 * 建模XML格式数据并由控制器元素提供功能：具有自己的语法格式，可以无差地转换为XML格式，同时通过yangtools plugin可以生成相应的java接口，类及方法，为opendaylight内部数据（控制器元素）处理编程提供了便利。
 * 定义语义元素和他们的关系，模拟所有的元素作为一个系统，YANG模型是一种树形结构的建模语言，通过YANG模型本身的语法和语义关系可以看出其定义方式的灵活性。
 * YANG数据模型的XML特性提供了一种自表述数据的方式，控制器元素和采用控制北向接口API的应用可以以一种原生格式与数据模型一起调用。
 * 利用一个模式语言简化控制器元素和应用的开发。模块中提供功能的开发者可以一个模型，从而可以创建对于所提供功能的更简单的、数据类型的API。因此降低了通过服务抽象层提供的数据结构的错误交互。
  
 * YANG模型通过树形结构的节点定义描述了数据模型的层级嵌套结构以及各属性的数据类型。YANG具有自己的语法格式，也可以无差别地转换为XML格式，称之为YIN。
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-3.png)
 * 除去header information、imports&includes、Type definitions之外，YANG模型的主要内容Configuration&Operational data declarations和Action（RPC）&Notification declarations对应了YANG模型定义中的“NETCONF协议、NETCONF远端过程调用（RPCs）、和NETCONF通知（notification）”。
 #####  YANG HEADER
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-4.png)
  * 上图所示是一个YANG文件的HEADER，其中module name（vxlan）要与YANG文件的文件名一致（即这个YANG文件的名字为vxlan.yang），namespace用来唯一标识这个YANG模型与其他YANG模型不同，prefix作为namespace的一种简写，其次import用来定义导入的其他YANG模型，注意到在后面的大括号中包括这个YANG模型的prefix和revision-data。revision用来唯一定义这个YANG模型的revision。其余一些organization、contact、description定义仅用于描述。YANG模型是一个XML格式定义语言。
  * 另外，针对上图示例中没有体现的“include”来说，include是用于将sub-module引入到module里面，这个module不一定要有一个文件。Submodule没有namespace而是以belongs-to来表征属于哪一个main module.
 #####  YANG TYPES
 ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-5.png)
  * YANG模型的Data Type包括Base Type和Derived Type, Base Type即为一个简单的类型，Derived Type或许是typedefs定义的一个Base Type或许是grouping定义的具有结构的类型。
  ##### Typedef Statement
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-6.png)
  * 图中定义实现了一个“percent”类型（Derived Type），
  * 在Typedef中还包涵诸如“rang”、“length”的细节定义.
  ##### Container Statement
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-7.png)
  * 作为data store有效入口的存在，可以理解为从container处以下的值才是有效的，没有值，但包含一系列的子节点
  ##### Grouping Statement
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-8.png)
  * 定义树形结构的“暂时”树干，这么说主要是区别于container，从形式上看两者及其相似都是具有树形结构，但在运行过程中grouping是无效的数据，只有当它作为衍生类型（uses）存在于container中时才有效.
  ##### Leaf Statement
  * leaf:用来定义属性值，如name,ID等。有值，但不包含任何子节点
  ##### List Statement
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-9.png)
  * 定义了一组具有相同数据结构的数据，在json格式的实例中是一个数组，在xml格式的实例中是一系列名称和结构相同的xml节点 。
  * List中的各个元素之间通过key来唯一标识；例如nodes兼具leaf和list的特点，定义了一组相同类型的值。不包含子节点。在json格式实例中是一个数组且数组中每个元素都是一个值，在xml格式的实例中是一系列名称相同值不同的xml节点.
  ##### Choice & case Statement
  * choice:定义的节点结构是不完全确定的。它包含多个case子节点，代表不同的分支，分别定义了该节点的一种可能的结构。最终节点的结构是且仅能是所有分支中的一种。
  ##### Augment
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-10.png)
  * YANG模型允许一个module插入附加节点到data models中，包括当前的module(以及子mudule)或者一个外部module. 对于供应商来说，增加vendor-specific参数到标注的data model中可协作使用。
  ##### Configuration & Operational Data Store
  * Data store中的数据存储分两种形式：config和operational ，config持有由应用所写的数据，而operational反映了设备的实际状态，从设备读取数据，如果没有错误即可以看到设备的当前实际信息。
  * 在YANG模型中，只有当 “config true”存在时这段数据才是config data store的内容，否则均为operational data store，不定义则默认”config false”.<br>
    ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-11.png)
  ##### RPC
  * rpc：用于定义netconf的一个rpc操作。它可能包含input和output子节点，分别是该rpc操作所需要的输入和输出数据结构。若没有则表明该操作不需要输入数据或者没有输出数据。<br>
   ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-12.png)
  ##### NOTIFICAION
  ![image](https://img1.sdnlab.com/wp-content/uploads/2015/12/SDN-battle-group-share-7-picture-13.png)
  * 除了rpc，yang还有一个类似的“notification”， notification用于定义netconf的通知消息的内容，也是用来定义一个服务。两者的区别在于rpc是一对一的，即单播，而notification是多播的，当Provider提交一个notification时，所有的订阅该服务的Consumer都会收到通知，如典型的PacketIn消息，所谓的订阅即实现该notification的接口。rpc生成的接口类名后缀都是Service。nontification生成的接口类名后缀是Listener。<br>
  ##### Plugin Example
  * [添加插件链接](https://netopeer.liberouter.org/doc/sysrepo/master/sysrepo_plugind.html)

  ##### netopeer2-cli使用教程
  * [视频教程链接](https://asciinema.org/a/160247)
  * 我的理解是：需要安装yang模型,启动netopeer2-server和sysrepod，然后用专用的程序监视这个模块的动态，编辑xml文件添加到数据库中，可以通过get --filter-xpath来获取添加后的数据，添加后都是有记录存在的。可以拷贝running表到startup表中。
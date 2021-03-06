FROM ubuntu:18.04
RUN apt-get  update && apt-get -y install wget
RUN wget -O /etc/apt/sources.list https://repo.huaweicloud.com/repository/conf/Ubuntu-Ports-bionic.list
# defaults
RUN \
	apt-get update && apt-get install -y \
	git \
	curl \
	wget \
	libssh-dev \
	libssl-dev \
	libtool \
	build-essential \
	vim \
	libtool	\
	autoconf \
	automake \
	pkg-config \
	libgtk-3-dev \
	make \
	vim \
	valgrind \
	doxygen \
	libev-dev \
	libpcre3-dev \
	unzip \
	sudo \
	python3 \
	build-essential \
	bison \
	flex \
      swig \
      libcmocka0 \
      libcmocka-dev \
      cmake \
      supervisor

# Adding netconf user
RUN adduser --system netconf
RUN mkdir -p /home/netconf/.ssh
RUN echo "netconf:netconf" | chpasswd && adduser netconf sudo


# Clearing and setting authorized ssh keys
RUN \
	echo '' > /home/netconf/.ssh/authorized_keys && \
	ssh-keygen -A && \
	ssh-keygen -t rsa -b 4096 -P '' -f /home/netconf/.ssh/id_rsa && \
	cat /home/netconf/.ssh/id_rsa.pub >> /home/netconf/.ssh/authorized_keys


# Updating shell to bash
RUN sed -i s#/home/netconf:/bin/false#/home/netconf:/bin/bash# /etc/passwd

RUN mkdir /opt/dev && sudo chown -R netconf /opt/dev

# set password for user (same as the username)
RUN echo "root:root" | chpasswd

# libyang
RUN \
      cd /opt/dev && \
      git clone https://github.com/CESNET/libyang.git && cd libyang && \
      git checkout devel && \
      mkdir build && cd build && \
      cmake -DCMAKE_BUILD_TYPE:String="Debug" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_BUILD_TESTS=OFF .. && \
      make -j2 && \
      make install

# libnetconf2
RUN \
      cd /opt/dev && \
      git clone https://github.com/CESNET/libnetconf2.git && cd libnetconf2 && \
      git checkout devel && \
      mkdir build && cd build && \
      cmake  -DCMAKE_BUILD_TYPE:String="Debug" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DENABLE_BUILD_TESTS=OFF .. && \
      make -j2 && \
      make install

# sysrepo
RUN \
      cd /opt/dev && \
      git clone https://github.com/sysrepo/sysrepo.git && cd sysrepo && \
	  git checkout devel && \
      mkdir build && cd build && \
      cmake -DENABLE_TESTS=OFF -DCMAKE_BUILD_TYPE="Debug" -DCMAKE_INSTALL_PREFIX:PATH=/usr -DREPOSITORY_LOC:PATH=/etc/sysrepo .. && \
      make -j2 && \
      make install

# netopeer 2
RUN \
      cd /opt/dev && git clone https://github.com/CESNET/Netopeer2.git && cd Netopeer2 && \
      git checkout devel-server && \
      cd /opt/dev/Netopeer2/server && \
      mkdir build && cd build && \
      cmake -DCMAKE_BUILD_TYPE:String="Debug" -DCMAKE_INSTALL_PREFIX:PATH=/usr .. && \
      make -j2 && \
      make install && \
      cd /opt/dev/Netopeer2/cli && \
      mkdir build && cd build && \
      cmake -DCMAKE_BUILD_TYPE:String="Debug" -DCMAKE_INSTALL_PREFIX:PATH=/usr .. && \
      make -j2 && \
      make install

ENV EDITOR vim
EXPOSE 830

COPY supervisord.conf /etc/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

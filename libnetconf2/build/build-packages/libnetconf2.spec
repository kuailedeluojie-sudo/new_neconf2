Name: libnetconf2
Version: 1.1.26
Release: 0
Summary: libnetconf2 library
Url: https://github.com/cesnet/libnetconf2
Source: https://github.com/cesnet/libnetconf2/archive/master.tar.gz
Source1: libnetconf2.rpmlintrc
License: BSD-3-Clause
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}

%if 0%{?centos_version} || 0%{?centos_ver} || 0%{?scientificlinux_version}
Requires:  libssh >= 0.7.1
%else
%if 0%{?suse_version}
Requires:  libssh4 >= 0.7.1
Requires:  (libssh4 < 0.9.3 or libssh4 > 0.9.4)
%else
Requires:  libssh >= 0.7.1
Requires:  (libssh < 0.9.3 or libssh > 0.9.4)
%endif
%endif

Requires:  libyang >= 0.16
Requires:  openssl

BuildRequires:  cmake
BuildRequires:  doxygen
BuildRequires:  libyang-devel >= 0.16
BuildRequires:  gcc
BuildRequires:  libcmocka-devel
BuildRequires:  libssh-devel >= 0.7.1
BuildRequires:  openssl-devel

%if 0%{?suse_version}
BuildRequires:  timezone
%endif

%package devel
Summary:    Headers of libnetconf2 library
Requires:   %{name} = %{version}-%{release}
Requires:   libssh-devel

%description devel
libnetconf2 library headers for C.

%description
NETCONF library in C providing API for both clients and servers.

%prep
%setup -n libnetconf2-master
mkdir build

%build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_BUILD_TYPE="Package" \
   -DENABLE_VALGRIND_TESTS=OFF ..
make

%check
cd build
ctest --output-on-failure

%install
cd build
make DESTDIR=%{buildroot} install

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-,root,root)
%{_libdir}/libnetconf2.so.*

%files devel
%defattr(-,root,root)
%{_libdir}/libnetconf2.so
%{_libdir}/pkgconfig/libnetconf2.pc
%{_includedir}/libnetconf2/*
%{_includedir}/nc_client.h
%{_includedir}/nc_server.h
%dir %{_includedir}/libnetconf2/

%changelog

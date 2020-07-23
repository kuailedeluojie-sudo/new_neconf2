name: libyang1
Version: 1.0.176
Release: 0
Summary: Libyang library
Url: https://github.com/CESNET/libyang
Source: %{url}/archive/master.tar.gz
Source1: libyang.rpmlintrc
License: BSD-3-Clause
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}

%if 0%{?scientificlinux_version} == 700 || ( 0%{?rhel} && 0%{?rhel} < 7 )
    %define with_lang_bind 0
%else
    %define with_lang_bind 1
%endif

%if ( 0%{?rhel} && 0%{?rhel} < 7 )
    %define with_ly_cache 0
%else
    %define with_ly_cache 1
%endif

Requires:  pcre
BuildRequires:  cmake
BuildRequires:  doxygen
BuildRequires:  pcre-devel
BuildRequires:  gcc
BuildRequires:  libcmocka-devel

%if %{with_lang_bind}
BuildRequires:  gcc-c++
%if 0%{?rhel} == 7
BuildRequires:  swig3 >= 3.0.12
%else
BuildRequires:  swig >= 3.0.12
%endif

%if 0%{?suse_version} + 0%{?fedora} + 0%{?centos_version} > 0
BuildRequires:  python3-devel
%else
BuildRequires:  python36-devel
%endif

%endif

%package -n libyang-devel
Summary:    Headers of libyang library
Requires:   %{name} = %{version}-%{release}
Requires:   pcre-devel

%package -n libyang-tools
Summary:    Helper Tools
Requires:   %{name} = %{version}-%{release}

%if %{with_lang_bind}
%package -n libyang-cpp1
Summary:    Bindings to c++ language
Requires:   %{name} = %{version}-%{release}

%package -n libyang-cpp-devel
Summary:    Headers of bindings to c++ language
Requires:   libyang-cpp1 = %{version}-%{release}
Requires:   pcre-devel

%package -n python3-yang1
Summary:    Binding to python
Requires:   libyang-cpp1 = %{version}-%{release}
Requires:   %{name} = %{version}-%{release}

%description -n libyang-cpp1
Bindings of libyang library to C++ language.

%description -n libyang-cpp-devel
Headers of bindings to c++ language.

%description -n python3-yang1
Bindings of libyang library to python language.
%endif

%description -n libyang-devel
Headers of libyang library.

%description -n libyang-tools
Helper Tools and examples for libyang library.

%description
libyang is YANG data modelling language parser and toolkit written (and providing API) in C.

%prep
%setup -n libyang-master
mkdir build

%build
cd build
%if %{with_lang_bind}
    %define cmake_lang_bind "-DGEN_LANGUAGE_BINDINGS=ON"
%else
    %define cmake_lang_bind "-DGEN_LANGUAGE_BINDINGS=OFF"
%endif
%if %{with_ly_cache}
    %define cmake_ly_cache "-DENABLE_CACHE=ON"
%else
    %define cmake_ly_cache "-DENABLE_CACHE=OFF"
%endif

cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr \
   -DCMAKE_BUILD_TYPE:String="Package" \
   -DENABLE_LYD_PRIV=ON \
   -DGEN_JAVA_BINDINGS=OFF \
   -DGEN_JAVASCRIPT_BINDINGS=OFF \
   %{cmake_lang_bind} \
   %{cmake_ly_cache} ..
make

%check
cd build
ctest --output-on-failure

%install
cd build
make DESTDIR=%{buildroot} install

%post -p /sbin/ldconfig
%if %{with_lang_bind}
%post -n libyang-cpp1 -p /sbin/ldconfig
%endif

%postun -p /sbin/ldconfig
%if %{with_lang_bind}
%postun -n libyang-cpp1 -p /sbin/ldconfig
%endif

%files
%defattr(-,root,root)
%{_libdir}/libyang.so.*
%{_libdir}/libyang1/*
%dir %{_libdir}/libyang1/

%files -n libyang-devel
%defattr(-,root,root)
%{_libdir}/libyang.so
%{_libdir}/pkgconfig/libyang.pc
%{_includedir}/libyang/*.h
%dir %{_includedir}/libyang/

%files -n libyang-tools
%{_bindir}/yanglint
%{_bindir}/yangre
%{_datadir}/man/man1/yanglint.1.gz
%{_datadir}/man/man1/yangre.1.gz

%if %{with_lang_bind}
%files -n libyang-cpp1
%defattr(-,root,root)
%{_libdir}/libyang-cpp.so.*

%files -n libyang-cpp-devel
%defattr(-,root,root)
%{_libdir}/libyang-cpp.so
%{_includedir}/libyang/*.hpp
%{_libdir}/pkgconfig/libyang-cpp.pc
%dir %{_includedir}/libyang/

%files -n python3-yang1
%defattr(-,root,root)
%{_libdir}/python*

%endif

%changelog

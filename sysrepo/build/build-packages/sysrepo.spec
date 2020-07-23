Name: sysrepo
Version: 1.4.66
Release: 0
Summary: Sysrepo library
Url: https://github.com/sysrepo/sysrepo
Source: https://github.com/sysrepo/sysrepo/archive/master.tar.gz
Source1: sysrepo.rpmlintrc
License: Apache-2.0
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}

%if 0%{?scientificlinux_version} == 700
    %define with_lang_bind 0
%else
    %define with_lang_bind 1
%endif

Requires:  libyang >= 1.0.165
BuildRequires:  cmake
BuildRequires:  doxygen
BuildRequires:  libyang-devel >= 1.0.165
BuildRequires:  gcc
BuildRequires:  libcmocka-devel

%if %{with_lang_bind}

BuildRequires:  gcc-c++
BuildRequires:  libyang-cpp-devel >= 1.0.165
BuildRequires:  python3-yang >= 1.0.165
%if 0%{?centos_version}
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

%package devel
Summary:    Headers of Sysrepo library
Requires:   %{name} = %{version}-%{release}
Requires:   libyang-devel >= 1.0.165

%if %{with_lang_bind}
%package -n sysrepo-cpp
Summary:    Sysrepo bindings to C++
Requires:   %{name} = %{version}-%{release}
Requires:   libyang-cpp >= 1.0.165

%package -n sysrepo-cpp-devel
Summary:    Headers of bindings to C++
Requires:   sysrepo-cpp = %{version}-%{release}
Requires:   libyang-cpp-devel >= 1.0.165

%package -n python3-sysrepo
Summary:    Sysrepo bindings to Python3
Requires:   sysrepo-cpp = %{version}-%{release}
Requires:   %{name} = %{version}-%{release}
Requires:   python3-yang >= 1.0.165

%description -n sysrepo-cpp
Sysrepo library bindings in C++ language.

%description -n sysrepo-cpp-devel
Headers of Sysrepo library bindings in C++ language.

%description -n python3-sysrepo
Sysrepo library bindings in Python3 language.
%endif

%description devel
Sysrepo library headers for C.

%description
YANG-based system repository for all-around configuration management.

%prep
%setup -n sysrepo-master
mkdir build

%build
cd build
%if %{with_lang_bind}
    %define cmake_lang_bind "-DGEN_LANGUAGE_BINDINGS=ON"
%else
    %define cmake_lang_bind "-DGEN_LANGUAGE_BINDINGS=OFF"
%endif
cmake -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_BUILD_TYPE="Package" \
   %{cmake_lang_bind} ..
make

%check
cd build
SYSREPO_REPOSITORY_PATH=$PWD ctest --output-on-failure

%install
cd build
make DESTDIR=%{buildroot} install

%post -p /sbin/ldconfig
%if %{with_lang_bind}
%post -n sysrepo-cpp -p /sbin/ldconfig
%endif

%postun -p /sbin/ldconfig
%if %{with_lang_bind}
%postun -n sysrepo-cpp -p /sbin/ldconfig
%endif

%files
%defattr(-,root,root)
%{_bindir}/sysrepoctl
%{_bindir}/sysrepocfg
%{_bindir}/sysrepo-plugind
%{_libdir}/libsysrepo.so.*

%files devel
%defattr(-,root,root)
%{_libdir}/libsysrepo.so
%{_libdir}/pkgconfig/sysrepo.pc
%{_includedir}/sysrepo.h
%{_includedir}/sysrepo/*.h
%dir %{_includedir}/sysrepo/

%if %{with_lang_bind}
%files -n sysrepo-cpp
%defattr(-,root,root)
%{_libdir}/libsysrepo-cpp.so.*

%files -n sysrepo-cpp-devel
%defattr(-,root,root)
%{_libdir}/libsysrepo-cpp.so
%{_includedir}/sysrepo-cpp/*.hpp
%{_libdir}/pkgconfig/sysrepo-cpp.pc
%dir %{_includedir}/sysrepo-cpp/

%files -n python3-sysrepo
%defattr(-,root,root)
%{_libdir}/python*
%endif

%changelog

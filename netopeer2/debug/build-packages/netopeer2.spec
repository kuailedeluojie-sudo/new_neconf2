Name: netopeer2
Version: 1.1.34
Release: 0
Summary: NETCONF tools
Url: https://github.com/cesnet/netopeer2
Source: https://github.com/cesnet/netopeer2/archive/master.tar.gz
License: BSD-3-Clause
BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}

%if 0%{?suse_version}
Requires:  libssh4 >= 0.7.1
%else
Requires:  libssh >= 0.7.1
%endif

Requires:  libyang >= 1.0
Requires:  sysrepo >= 1.4.57
Requires:  libnetconf2 >= 1.1.23
Requires:  openssl

BuildRequires:  cmake
BuildRequires:  gcc
BuildRequires:  libssh-devel >= 0.7.1
BuildRequires:  libyang-devel >= 1.0
BuildRequires:  sysrepo-devel >= 1.4.57
BuildRequires:  libnetconf2-devel >= 1.1.23
BuildRequires:  openssl-devel

%if 0%{?suse_version}
BuildRequires:  timezone
%endif

%description
NETCONF tools suite including a server and command-line client

%prep
%setup -n netopeer2-master
mkdir build

%build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr \
   -DCMAKE_BUILD_TYPE="Package" \
   -DINSTALL_MODULES=OFF \
   -DGENERATE_HOSTKEY=OFF \
   -DMERGE_LISTEN_CONFIG=OFF ..
make

%install
cd build
make DESTDIR=%{buildroot} install

%post
#!/bin/bash
groupadd -f netconf
NP2_MODULE_DIR=/usr/share/yang/modules/netopeer2 NP2_MODULE_PERMS=660 NP2_MODULE_OWNER=root NP2_MODULE_GROUP=netconf
#!/bin/bash

# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS, NP2_MODULE_OWNER, NP2_MODULE_GROUP must be defined when executing this script!
if [ -z "$NP2_MODULE_DIR" -o -z "$NP2_MODULE_PERMS" -o -z "$NP2_MODULE_OWNER" -o -z "$NP2_MODULE_GROUP" ]; then
    echo "Required environment variables not defined!"
    exit 1
fi

# avoid problems with sudo PATH
if [ `id -u` -eq 0 ]; then
    SYSREPOCTL=`su -c 'which sysrepoctl' -l $USER`
else
    SYSREPOCTL=`which sysrepoctl`
fi
MODDIR=${DESTDIR}${NP2_MODULE_DIR}
PERMS=${NP2_MODULE_PERMS}
OWNER=${NP2_MODULE_OWNER}
GROUP=${NP2_MODULE_GROUP}

# array of modules to install
MODULES=(
"ietf-netconf-acm@2018-02-14.yang"
"ietf-netconf@2013-09-29.yang -e writable-running -e candidate -e rollback-on-error -e validate -e startup -e url -e xpath"
"ietf-netconf-monitoring@2010-10-04.yang"
"ietf-netconf-nmda@2019-01-07.yang -e origin -e with-defaults"
"nc-notifications@2008-07-14.yang"
"notifications@2008-07-14.yang"
"ietf-x509-cert-to-name@2014-12-10.yang"
"ietf-crypto-types@2019-07-02.yang"
"ietf-keystore@2019-07-02.yang -e keystore-supported"
"ietf-truststore@2019-07-02.yang -e truststore-supported -e x509-certificates"
"ietf-tcp-common@2019-07-02.yang -e keepalives-supported"
"ietf-ssh-server@2019-07-02.yang -e local-client-auth-supported"
"ietf-tls-server@2019-07-02.yang -e local-client-auth-supported"
"ietf-netconf-server@2019-07-02.yang -e ssh-listen -e tls-listen -e ssh-call-home -e tls-call-home"
)

# functions
INSTALL_MODULE() {
    "$SYSREPOCTL" -a -i $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
    local rc=$?
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

UPDATE_MODULE() {
    "$SYSREPOCTL" -a -U $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
    local rc=$?
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

ENABLE_FEATURE() {
    "$SYSREPOCTL" -a -c $1 -e $2 -v2
    local rc=$?
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

# get current modules
SCTL_MODULES=`$SYSREPOCTL -l`

for i in "${MODULES[@]}"; do
    name=`echo "$i" | sed 's/\([^@]*\).*/\1/'`

    SCTL_MODULE=`echo "$SCTL_MODULES" | grep "^$name \+|[^|]*| I"`
    if [ -z "$SCTL_MODULE" ]; then
        # install module with all its features
        INSTALL_MODULE "$i"
        continue
    fi

    sctl_revision=`echo "$SCTL_MODULE" | sed 's/[^|]*| \([^ ]*\).*/\1/'`
    revision=`echo "$i" | sed 's/[^@]*@\([^\.]*\).*/\1/'`
    if [ "$sctl_revision" \< "$revision" ]; then
        # update module without any features
        file=`echo "$i" | cut -d' ' -f 1`
        UPDATE_MODULE "$file"
    fi

    # parse sysrepoctl features and add extra space at the end for easier matching
    sctl_features="`echo "$SCTL_MODULE" | sed 's/\([^|]*|\)\{6\}\(.*\)/\2/'` "
    # parse features we want to enable
    features=`echo "$i" | sed 's/[^ ]* \(.*\)/\1/'`
    while [ "${features:0:3}" = "-e " ]; do
        # skip "-e "
        features=${features:3}
        # parse feature
        feature=`echo "$features" | sed 's/\([^[:space:]]*\).*/\1/'`

        # enable feature if not already
        sctl_feature=`echo "$sctl_features" | grep " ${feature} "`
        if [ -z "$sctl_feature" ]; then
            # enable feature
            ENABLE_FEATURE $name $feature
        fi

        # next iteration, skip this feature
        features=`echo "$features" | sed 's/[^[:space:]]* \(.*\)/\1/'`
    done
done

#!/bin/bash

set -e

# avoid problems with sudo PATH
if [ `id -u` -eq 0 ]; then
    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
    OPENSSL=`su -c 'which openssl' -l $USER`
else
    SYSREPOCFG=`which sysrepocfg`
    OPENSSL=`which openssl`
fi

# check that there is no SSH key with this name yet
KEYSTORE_KEY=`$SYSREPOCFG -X -x "/ietf-keystore:keystore/asymmetric-keys/asymmetric-key[name='genkey']/name"`
if [ -z "$KEYSTORE_KEY" ]; then

# generate a new key
PRIVPEM=`$OPENSSL genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -outform PEM 2>/dev/null`
# remove header/footer
PRIVKEY=`grep -v -- "-----" - <<STDIN
$PRIVPEM
STDIN`
# get public key
PUBPEM=`$OPENSSL rsa -pubout 2>/dev/null <<STDIN
$PRIVPEM
STDIN`
# remove header/footer
PUBKEY=`grep -v -- "-----" - <<STDIN
$PUBPEM
STDIN`

# generate edit config
CONFIG="<keystore xmlns=\"urn:ietf:params:xml:ns:yang:ietf-keystore\">
    <asymmetric-keys>
        <asymmetric-key>
            <name>genkey</name>
            <algorithm>rsa2048</algorithm>
            <public-key>$PUBKEY</public-key>
            <private-key>$PRIVKEY</private-key>
        </asymmetric-key>
    </asymmetric-keys>
</keystore>"
TMPFILE=`mktemp -u`
printf -- "$CONFIG" > $TMPFILE
# apply it to startup and running
$SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-keystore -v2
$SYSREPOCFG -C startup -m ietf-keystore -v2
# remove the tmp file
rm $TMPFILE

fi

#!/bin/bash

set -e

# avoid problems with sudo PATH
if [ `id -u` -eq 0 ]; then
    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
else
    SYSREPOCFG=`which sysrepocfg`
fi
KS_KEY_NAME=genkey

# check that there is no listen/Call Home configuration yet
SERVER_CONFIG=`$SYSREPOCFG -X -x "/ietf-netconf-server:netconf-server/listen/endpoint[1]/name | /ietf-netconf-server:netconf-server/call-home/netconf-client[1]/name"`
if [ -z "$SERVER_CONFIG" ]; then

# import default config
CONFIG="<netconf-server xmlns=\"urn:ietf:params:xml:ns:yang:ietf-netconf-server\">
    <listen>
        <endpoint>
            <name>default-ssh</name>
            <ssh>
                <tcp-server-parameters>
                    <local-address>0.0.0.0</local-address>
                    <keepalives>
                        <idle-time>1</idle-time>
                        <max-probes>10</max-probes>
                        <probe-interval>5</probe-interval>
                    </keepalives>
                </tcp-server-parameters>
                <ssh-server-parameters>
                    <server-identity>
                        <host-key>
                            <name>default-key</name>
                            <public-key>
                                <keystore-reference>$KS_KEY_NAME</keystore-reference>
                            </public-key>
                        </host-key>
                    </server-identity>
                    <client-authentication>
                        <supported-authentication-methods>
                            <publickey/>
                            <passsword/>
                            <other>interactive</other>
                        </supported-authentication-methods>
                        <users/>
                    </client-authentication>
                </ssh-server-parameters>
            </ssh>
        </endpoint>
    </listen>
</netconf-server>"
TMPFILE=`mktemp -u`
printf -- "$CONFIG" > $TMPFILE
# apply it to startup and running
$SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-netconf-server -v2
$SYSREPOCFG -C startup -m ietf-netconf-server -v2
# remove the tmp file
rm $TMPFILE

fi


%files
%defattr(-,root,root)
%{_bindir}/netopeer2-server
%{_datadir}/yang
%{_bindir}/netopeer2-cli
%{_mandir}/man1

%changelog

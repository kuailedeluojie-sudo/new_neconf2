#!/bin/bash

# env variables NP2_MODULE_DIR, NP2_MODULE_PERMS, NP2_MODULE_OWNER, NP2_MODULE_GROUP must be defined when executing this script!

echo  "$NP2_MODULE_DIR" 
echo  "$NP2_MODULE_PERMS" 
echo  "$NP2_MODULE_OWNER" 
echo  "$NP2_MODULE_GROUP"

export  SYSREPOCTL=/opt/all/sysrepo/bin/sysrepoctl
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
export  SYSREPOCTL=/opt/all/sysrepo/bin/sysrepoctl
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
    echo ---------------------------------------------
	echo wr "$SYSREPOCTL" -a -i $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2  
     wr "$SYSREPOCTL" -a -i $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
    local rc=$?
    echo $rc
    echo ---------------------------------------------
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

UPDATE_MODULE() {
    echo ---------------------------------------------------------
    wr "$SYSREPOCTL" -a -U $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
    local rc=$?
    echo wr "$SYSREPOCTL" -a -U $MODDIR/$1 -s "$MODDIR" -p "$PERMS" -o "$OWNER" -g "$GROUP" -v2
    echo $rc
    echo ---------------------------------------------------------
   
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

ENABLE_FEATURE() {
   wr "$SYSREPOCTL" -a -c $1 -e $2 -v2
    local rc=$?
    if [ $rc -ne 0 ]; then
        exit $rc
    fi
}

# get current modules
SCTL_MODULES=`wr  $SYSREPOCTL -l`

# 把MODULES这个字符串数组赋值给变量i
for i in "${MODULES[@]}"; do 
# 取字符串中@号前面的字符串赋值给变量name

    name=`echo "$i" | sed 's/\([^@]*\).*/\1/'`
    echo ------------------------------------
    echo $name
    echo ------------------------------------
    echo ************************************
    echo "$SCTL_MODULES"
    echo ************************************
    echo ++++++++++++++++++++++++++++++++++++
    
    echo ++++++++++++++++++++++++++++++++++++
    SCTL_MODULE=`echo "$SCTL_MODULES" | grep "^$name \+|[^|]*| I"`
    echo $SCTL_MODULE
    echo ++++++++++++++++++++++++++++++++++++
    if [ -z "$SCTL_MODULE" ]; then
        # install module with all its features
    echo ************************************
        echo  INSTALL_MODULE "$i"
        INSTALL_MODULE "$i"
        
    echo ************************************
        continue
    fi

    echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    
    
    sctl_revision=`echo "$SCTL_MODULE" | sed 's/[^|]*| \([^ ]*\).*/\1/'`
    revision=`echo "$i" | sed 's/[^@]*@\([^\.]*\).*/\1/'`
    echo $sctl_revision
    echo $revision
    echo @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    if [ "$sctl_revision" \< "$revision" ]; then
        # update module without any features
        echo -----------------------------------
        file=`echo "$i" | cut -d' ' -f 1`
        echo UPDATE_MODULE "$file"
        UPDATE_MODULE "$file"
        echo -----------------------------------

    fi

    # parse sysrepoctl features and add extra space at the end for easier matching
    sctl_features="`echo "$SCTL_MODULE" | sed 's/\([^|]*|\)\{6\}\(.*\)/\2/'` "
    # parse features we want to enable
    features=`echo "$i" | sed 's/[^ ]* \(.*\)/\1/'`
    echo ==========================================
    echo $sctl_features
    echo $features
    echo ==========================================

    while [ "${features:0:3}" = "-e " ]; do
        # skip "-e "
        features=${features:3}
        echo =========================================================
        # parse feature
        feature=`echo "$features" | sed 's/\([^[:space:]]*\).*/\1/'`
        echo $features
        # enable feature if not already
        sctl_feature=`echo "$sctl_features" | grep " ${feature} "`

        echo $sctl_feature
       echo =========================================================

        if [ -z "$sctl_feature" ]; then
            # enable feature
            echo ******************************
            ENABLE_FEATURE $name $feature
            echo   ENABLE_FEATURE $name $feature 
            echo ******************************
        fi

        # next iteration, skip this feature
        echo    next iteration, skip this feature
        echo =======================================
        features=`echo "$features" | sed 's/[^[:space:]]* \(.*\)/\1/'`
        echo $features
        echo =======================================
    done
done

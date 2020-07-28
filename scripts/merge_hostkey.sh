#!/bin/bash

#"set -e"之后出现的代码，一旦出现了返回值非零，整个脚本就会立即退出，那么就可以避免一些脚本的危险操作
set -e

# avoid problems with sudo PATH
if [ `id -u` -eq 0 ]; then
    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
    OPENSSL=`su -c 'which openssl' -l $USER`
else
    SYSREPOCFG=`which sysrepocfg`
    OPENSSL=`which openssl`
fi
export  SYSREPOCFG=/opt/all/sysrepo/bin/sysrepocfg
export  OPENSSL=/opt/all/openssl/bin/openssl
# check that there is no SSH key with this name yet
echo wr $SYSREPOCFG -X -x "/ietf-keystore:keystore/asymmetric-keys/asymmetric-key[name='genkey']/name"
KEYSTORE_KEY=`wr $SYSREPOCFG -X -x "/ietf-keystore:keystore/asymmetric-keys/asymmetric-key[name='genkey']/name"`
echo  $KEYSTORE_KEY
if [ -z "$KEYSTORE_KEY" ]; then

# generate a new key
PRIVPEM=`wr $OPENSSL genpkey -algorithm RSA -pkeyopt rsa_keygen_bits:2048 -outform PEM 2>/dev/null`
echo  $PRIVPEM
# remove header/footer
PRIVKEY=`grep -v -- "-----" - <<STDIN
$PRIVPEM
STDIN`
# get public key
PUBPEM=`wr $OPENSSL rsa -pubout 2>/dev/null <<STDIN
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
echo "$SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-keystore -v2"
$SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-keystore -v2
echo "$SYSREPOCFG -C startup -m ietf-keystore -v2"
$SYSREPOCFG -C startup -m ietf-keystore -v2
# remove the tmp file
rm $TMPFILE

fi

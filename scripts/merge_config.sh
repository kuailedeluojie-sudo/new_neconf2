#!/bin/bash

#set -e

# avoid problems with sudo PATH
if [ `id -u` -eq 0 ]; then
    SYSREPOCFG=`su -c 'which sysrepocfg' -l $USER`
else
    SYSREPOCFG=`which sysrepocfg`
fi
KS_KEY_NAME=genkey
export  SYSREPOCFG=/opt/all/sysrepo/bin/sysrepocfg
echo -------------------------------------------------------------
# check that there is no listen/Call Home configuration yet
echo wr $SYSREPOCFG -X -x "/ietf-netconf-server:netconf-server/listen/endpoint[1]/name | /ietf-netconf-server:netconf-server/call-home/netconf-client[1]/name"
SERVER_CONFIG= `wr $SYSREPOCFG -X -x "/ietf-netconf-server:netconf-server/listen/endpoint[1]/name | /ietf-netconf-server:netconf-server/call-home/netconf-client[1]/name"`
echo "$SERVER_CONFIG"
echo -------------------------------------------------------------
if [ -z "$SERVER_CONFIG" ]; then

echo **************************************
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
echo **************************************
echo "$CONFIG"
TMPFILE=`mktemp`
printf -- "$CONFIG" > $TMPFILE

# apply it to startup and running
echo \# apply it to startup and running

echo "wr $SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-netconf-server -v2"
wr $SYSREPOCFG --edit=$TMPFILE -d startup -f xml -m ietf-netconf-server -v2
echo "wr $SYSREPOCFG -C startup -m ietf-netconf-server -v2"
wr $SYSREPOCFG -C startup -m ietf-netconf-server -v2
# remove the tmp file
echo \# remove the tmp file
rm $TMPFILE

fi

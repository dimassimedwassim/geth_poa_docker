#!/bin/bash
set -e
cd /root/eth-net-intelligence-api
perl -pi -e "s/XXX/$(hostname)/g" app.json
/usr/bin/pm2 start ./app.json
sleep 3
geth --datadir=~/.ethereum/devchain init "/root/files/genesis.json"
sleep 3
echo "********************************************"
BOOTSTRAP_IP=`getent hosts bootstrap | cut -d" " -f1`
echo $BOOTSTRAP_IP
GETH_OPTS=${@/XXX/$BOOTSTRAP_IP}
echo "/////////////////////////////"
echo $GETH_OPTS
geth $GETH_OPTS

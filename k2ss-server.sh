#!/bin/sh

INSTALL_FLAG="/app/k2ss-server.installed"

if [ ! -f "$INSTALL_FLAG" ]; then
	touch $INSTALL_FLAG
fi
echo ${PWD1='zUp9YTxR2cvPcX'}

if [ $ENABLE_S2K = "no" ]
then
     ss-server -s 0.0.0.0 -p 9090 -m chacha20 -k Vipss$PWD1 -t 60 -u -A >/dev/null 2>&1
else
     ss-server -s 127.0.0.1 -p 9090 -m chacha20 -k ss$PWD1 -t 60 -u -A >/dev/null 2>&1 &
     sleep 5
     /app/server_linux_amd64 -l :39900 -t 127.0.0.1:9090 -mode fast2 -nocomp -mtu 1400 -sndwnd 2048 -rcvwnd 2048 -crypt salsa20 -key kk$PWD2 >/dev/null 2>&1
     while [[ true ]]; do
	sleep 1
     done
fi


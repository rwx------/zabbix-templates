#!/bin/bash

REDISCLI=/opt/app/gopath/bin/redis-cli
IP=$(echo $1 |awk -F':' '{print $1}')
PORT=$(echo $1 |awk -F':' '{print $2}')

if [ "x$2" == "xmem_ratio" ] ; then
    used=$($REDISCLI -h $IP -p $PORT info 2>&1 |grep -w "used_memory"|cut -d : -f2)
    max=$($REDISCLI -h $IP -p $PORT info 2>&1 | grep -w "maxmemory" |cut -d : -f2) 
    mem_ratio=$(printf "%d" $((${used//$'\r'}*100/${max//$'\r'})))
    echo $mem_ratio
else
    echo $($REDISCLI -h $IP -p $PORT info 2>&1 | grep -w $2 |cut -d : -f2)
fi

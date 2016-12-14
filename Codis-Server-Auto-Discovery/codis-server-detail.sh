#!/bin/bash

REDISCLI=/opt/app/gopath/bin/redis-cli
IP=$(echo $1 |awk -F':' '{print $1}')
PORT=$(echo $1 |awk -F':' '{print $2}')

if [ "x$2" == "xmem_ratio" ] ; then
    used=$($REDISCLI -h $IP -p $PORT info 2>&1 |grep -w "used_memory"|cut -d : -f2)
    max=$($REDISCLI -h $IP -p $PORT config get maxmemory 2>&1 | tail -n 1)
    mem_ratio=$(printf "%d" $((${used//$'\r'}*100/${max})))
    echo $mem_ratio
elif [ "x$2" == "xmaxmemory" ]; then
    echo $($REDISCLI -h $IP -p $PORT config get maxmemory 2>&1 | tail -n 1)
elif [ "x$2" == "xtotal_keys" ]; then
    echo $($REDISCLI -h $IP -p $PORT info 2>&1 |grep -w keys |awk -F'[,=]' 'BEGIN {sum=0} {sum += $2} END {print sum}')
else
    echo $($REDISCLI -h $IP -p $PORT info 2>&1 | grep -w $2 |cut -d : -f2)
fi

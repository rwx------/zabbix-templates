#!/bin/bash

JQ=/usr/local/bin/jq

json=$(curl --connect-time 2 --max-time 4 -s http://$1/topom | $JQ '.config')
Prod=$(echo $json| $JQ -r '.product_name')
if [ "x$2" = "xprod_name" ] ; then
    echo "$Prod"
elif [ "x$2" = "xstatus" ] ; then
    admin_addr=$(echo $json |$JQ -r '.admin_addr')
    if [ "x$admin_addr" = "x$1" ]; then
        echo 0
    else
        echo 1
    fi
elif [ "x$2" = "xcodis_out_of_sync" ]; then
    curl --connect-time 2 --max-time 4 -s http://$1/topom | $JQ ".stats.group.models[].out_of_sync" |grep -c true
else
    echo '[error]: no such option!'
fi

#!/bin/bash

JQ=/usr/local/bin/jq

Prod=$(curl --connect-time 2 --max-time 4 -s http://$1/topom | $JQ '.config.product_name')
if [ "x$2" = "xprod_name" ] ; then
    echo "$Prod"
elif [ "x$2" = "xdashboard_dead" ] ; then
    if [ "x$Prod" = "x" ]; then
        echo 1
    else
        echo 0
    fi
elif [ "x$2" = "xcodis_out_of_sync" ]; then
    curl --connect-time 2 --max-time 4 -s http://$1/topom | $JQ ".stats.group.models[].out_of_sync" |grep -c true
elif [ "x$2" = "xproxy_offline" ]; then
    curl --connect-time 2 --max-time 4 -s http://$1/topom | $JQ ".stats.proxy.stats[].stats.online" |grep -c false
else
    echo '[error]: no such option!'
fi

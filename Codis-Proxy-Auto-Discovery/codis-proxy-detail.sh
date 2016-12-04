#!/bin/bash

JQ=/usr/local/bin/jq

json=$(curl --connect-time 2 --max-time 4 -s http://$1/proxy | $JQ '.stats')
if [ "x$2" = "xtotal" ] ; then
    echo $json |$JQ '.ops.total'
elif [ "x$2" = "xfails" ] ; then
    echo $json |$JQ '.ops.fails'
elif [ "x$2" = "xqps" ]; then
    echo $json |$JQ '.ops.qps'
elif [ "x$2" = "xonline" ]; then
    ol=$(echo $json |$JQ '.online')
    echo "$ol"
else
    echo '[error]: no such option!'
fi

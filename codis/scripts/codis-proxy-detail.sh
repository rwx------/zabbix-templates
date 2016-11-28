#!/bin/bash

JQ=/usr/local/bin/jq

json=$(curl --connect-time 2 --max-time 4 -s http://$1/proxy | $JQ '.stats.ops')
if [ "x$2" = "xtotal" ] ; then
    echo $json |$JQ '.total'
elif [ "x$2" = "xfails" ] ; then
    echo $json |$JQ '.fails'
elif [ "x$2" = "xqps" ]; then
    echo $json |$JQ '.qps'
else
    echo '[error]: no such option!'
fi

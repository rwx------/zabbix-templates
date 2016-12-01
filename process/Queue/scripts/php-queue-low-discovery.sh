#!/bin/bash

Queue=/tmp/queue-file.log
ps aux |grep Queue.php |grep -v grep|awk '{print $(NF-1),$NF}' > $Queue
num=$(cat $Queue |wc -l)

printf '{\n'
printf '\t"data":[\n'
while read line
do
    num=$(expr $num - 1)
    if [ $num -ne 0 ] ; then
        printf "\t\t{\"{#QUEUENAME}\":\"$line\"},\n"
    else
        printf "\t\t{\"{#QUEUENAME}\":\"$line\"}\n"
    fi
done < $Queue

printf '\t]\n'
printf '}\n'

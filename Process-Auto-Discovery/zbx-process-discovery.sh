#!/bin/bash

ProcessFile="/opt/scripts/conf/zbx-process.txt"
IFS=$'\n'

if [ ! -f $ProcessFile ]; then
    exit
fi

process_discovery () {
    ProcName=($(cat $ProcessFile|egrep -v "^#"))

    printf "{\n"
    printf "\t\"data\":[\n"
    num=${#ProcName[@]}
    for p in ${ProcName[@]}
    do
        num=$(( $num - 1 ))
        proc=$(echo $p|awk -F'#' '{print $1}')
        count=$(echo $p|awk -F'#' '{print $2}')
        if [ "x$count" = "x" ] ; then
            count=1
        fi
        if [ $num -ne 0 ] ; then
            printf "\t\t{\"{#PROCNAME}\":\"${proc}\",\"{#PROCNUM}\":\"${count}\"},\n"
        else
            printf "\t\t{\"{#PROCNAME}\":\"${proc}\",\"{#PROCNUM}\":\"${count}\"}\n\t]\n}\n"
        fi
    done
}

case "$1" in
    process_discovery)
        process_discovery
        ;;
    *)
        echo "Usage:$0 {process_discovery}"
        ;;
esac

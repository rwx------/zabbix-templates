#!/bin/bash

JQ=/usr/local/bin/jq
codis_dis() {
    port=($(cat /opt/app/conf/codis-fe.json |$JQ '.[].dashboard' |awk -F'"' '{print $2}'))
    num=($(cat /opt/app/conf/codis-fe.json |$JQ '.[].dashboard' |awk -F'"' '{print $2}'|wc -l))
    printf '{\n'
    printf '\t"data":[\n'
    for key in ${port[@]}
    do
        num=$(expr $num - 1)
        if [ $num -ne 0 ];then
            printf "\t\t{\"{#DASHBOARDPORT}\":\""${key}"\"},\n"
        else
            printf "\t\t{\"{#DASHBOARDPORT}\":\""${key}"\"}\n"
        fi
    done
    printf '\t]\n'
    printf '}\n'
}

codis_dis

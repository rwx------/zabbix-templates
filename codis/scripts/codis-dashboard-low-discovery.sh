#!/bin/bash

JQ=/usr/local/bin/jq
codis_dis() {
    port=($(cat /opt/app/conf/codis-fe.json |$JQ '.[].dashboard' |awk -F'"' '{print $2}'))
            printf '{\n'
            printf '\t"data":[\n'
               for key in ${!port[@]}
                   do
                       if [[ "${#port[@]}" -gt 1 && "${key}" -ne "$((${#port[@]}-1))" ]];then
              socket=`ps aux|grep ${port[${key}]}|grep -v grep|awk -F '=' '{print $10}'|cut -d ' ' -f 1`
                          printf '\t {\n'
                          printf "\t\t\t\"{#DASHBOARDPORT}\":\"${port[${key}]}\"},\n"
                     else [[ "${key}" -eq "((${#port[@]}-1))" ]]
              socket=`ps aux|grep ${port[${key}]}|grep -v grep|awk -F '=' '{print $10}'|cut -d ' ' -f 1`
                          printf '\t {\n'
                          printf "\t\t\t\"{#DASHBOARDPORT}\":\"${port[${key}]}\"}\n"
                       fi
               done
                          printf '\t ]\n'
                          printf '}\n'
}

codis_dis

#!/bin/bash

redis_dis() {
    RDS=($(ps aux |egrep "redis-server [1-9]" |awk '{print $NF}'))
    num=${#RDS[@]}
  
    # assemble json data
    printf '{\n'
    printf '\t"data":[\n'
    for i in ${RDS[@]}
    do
        num=$(expr $num - 1)
        ip=$(echo $i |awk -F':' '{print $1}')
        p=$(echo $i |awk -F':' '{print $2}')
        if [ $num -ne 0 ]; then
            printf "\t\t{\"{#RDSSERVER}\":\""${i}"\",\"{#RDSIP}\":\""${ip}"\",\"{#RDSPORT}\":\""${p}"\"},\n"
        else
            printf "\t\t{\"{#RDSSERVER}\":\""${i}"\",\"{#RDSIP}\":\""${ip}"\",\"{#RDSPORT}\":\""${p}"\"}\n"
        fi
    done
    printf '\t]\n'
    printf '}\n'
}

redis_dis

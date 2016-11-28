# zabbix自动发现方式监控codis集群 zabbix-codis-auto-discovery

基于zabbix的自动发现，自动监控，自动报警，不需要人工干预。
只需要在有codis-fe的服务器上添加template即可。

## 依赖
- awk/curl/xargs 
- jq  [网址](https://stedolan.github.io/jq/), `/usr/local/bin/jq` # 请换成自己的目录
- redis-cli  `/opt/app/gopath/bin/redis-cli` # 请换成自己的目录
- codis-fe.json的配置文件 `/opt/app/conf/codis-fe.json` # 请换成自己的目录


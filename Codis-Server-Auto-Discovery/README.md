# zabbix自动发现方式监控codis集群的codis-server实例
```
基于zabbix的自动发现，自动监控，自动报警，不需要人工干预。
只需要在有codis-fe的服务器上添加template即可。
```

### 版本
```
zabbix: 3.0+
codis:  3.1
```

### 依赖
```
- awk/curl/xargs 
- jq  [网址](https://stedolan.github.io/jq/), `/usr/local/bin/jq` # 请换成自己的目录
- redis-cli  `/opt/app/gopath/bin/redis-cli` # 请换成自己的目录
- codis-fe.json的配置文件 `/opt/app/conf/codis-fe.json` # 请换成自己的目录

### 监控项
- blocked_clients                        # 被阻塞的客户端数
- connected_clients                      # 当前连接的客户端数
- total_connections_received             # 自启动起连接的总数
- evicted_keys                           # 因内存大小限制，而被驱逐的键的个数
- expired_keys                           # 自启动以来过期的key数量
- total_commands_processed               # 总共处理的命令数
- role                                   # 角色: master or slave
- uptime_in_seconds                      # 已启动的秒数
- used_memory                            # 已用内存，单位Byte
- mem_ratio                              # 内存比率，已用内存占配置内存的比率 
- used_memory_rss                        # 系统给redis分配的内存（即常驻内存）
- net.tcp.port[{#CODISIP},{#CODISPORT}]  # 端口是否存活
```

### 告警项
```
- 端口不存活
- 内存比率超过70%
```

### 图表
```
- 连接图，显示客户端连接情况
- keys图，显示evicted_keys和expired_keys
- 状态图，显示codis是否存活
- 内存图，显示codis使用内存情况
```

### 自动发现周期
```
10分钟
```

# zabbix自动发现方式监控单机多redis-server实例
```
基于zabbix的自动发现，自动监控，自动报警，不需要人工干预。
```

### 版本
```
zabbix: 3.0+
```

### 依赖
```
- redis-cli 
```

### 监控项
```
- blocked_clients                        # 被阻塞的客户端数
- connected_clients                      # 当前连接的客户端数
- role                                   # 角色: master or slave
- redis_version                          # redis 版本
- maxmemory                              # 配置的最大内存
- used_memory                            # 已用内存，单位Byte
- mem_ratio                              # 内存比率，已用内存占配置内存的比率 
- used_memory_rss                        # 系统给redis分配的内存（即常驻内存）
- uptime_in_seconds                      # 已启动的秒数
- evicted_keys                           # 因内存大小限制，而被驱逐的键的个数
- expired_keys                           # 自启动以来过期的key数量
- instantaneous_ops_per_sec              # 每秒操作数
- total_commands_processed               # 总共处理的命令数
- total_keys                             # 该实例中所有keys的总数
- net.tcp.port[{#CODISIP},{#CODISPORT}]  # 端口是否存活
```

### 告警项
```
- 端口不存活
- 内存比率超过70%
- 主从角色的变更
```

### 图表
```
- keys图，显示该实例keys相关的统计信息
- ops图，显示该实例每秒操作数的采样信息
- 内存图，显示该实例内存使用情况
```

### 自动发现周期
```
10分钟
```

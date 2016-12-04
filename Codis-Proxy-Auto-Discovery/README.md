# zabbix自动发现方式监控codis集群的codis-proxy
```
基于zabbix的自动发现，自动监控，自动报警，不需要人工干预。
只需要在有codis-fe的服务器上添加相应模板即可。
```

### 版本
```
zabbix: 3.0+
codis:  3.1
```

### 依赖
```
- awk/curl/xargs 
- jq (https://stedolan.github.io/jq/), "/usr/local/bin/jq" # 请换成自己的目录
- redis-cli "/opt/app/gopath/bin/redis-cli"                # 请换成自己的目录
- codis-fe 的配置文件 "/opt/app/conf/codis-fe.json"        # 请换成自己的目录
```

### 监控项
```
- proxy fails                       # proxy 自启动以来失败连接总数
- proxy online status               # proxy 的在线状态
- proxy qps                         # proxy 的qps
- proxy total                       # proxy 自启动以来的连接总数
```

### 告警项
```
- proxy qps 大于1000时
- proxy 在线状态不为true时
```

### 图表
```
- 失败总数
- qps 情况
- 连接总数
```

### 自动发现周期
```
10分钟
```

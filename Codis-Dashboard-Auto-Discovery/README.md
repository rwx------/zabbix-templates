# zabbix自动发现方式监控codis集群的codis-dashboard
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
- codis server out of sync            # codis-server失效的总数
- product name                        # dashboard 对应的项目名称
- dashboard online status             # dashboard 在线状态
```

### 告警项
```
- codis-server 失效总数大于0时
- dashboard 不在线时
```

### 自动发现周期
```
10分钟
```

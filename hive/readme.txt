hive
===

TODO
---

## hive 自启动服务

## Cannot create directory /tmp/hive. Name node is in safe mode.


hive 
---

同时启动两个服务
```
$HIVE_HOME/bin/hive --service metastore >> /tmp/root/metastore.log 2>&1 &
$HIVE_HOME/bin/hive --service hiveserver2 >> /tmp/root/hiveserver2.log 2>&1 &
```

run
```
-v ~/data/hive/log:/tmp/root 
```

需要预先产生 metastore.log, hiveserver2.log file

mysql
---

```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123' WITH GRANT OPTION;
FLUSH RIVILEGES
```

```
alter database hive character set latin1;
FLUSH RIVILEGES
```

hive
---

```
java.net.URISyntaxException: Relative path in absolute URI: ${system:java.io.tmpdir%7D/$%7Bsystem:user.name%7D
```


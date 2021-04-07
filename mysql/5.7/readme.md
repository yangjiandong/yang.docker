## MySQL docker 配置


暂时取消

```
# audit
plugin-load=AUDIT=libaudit_plugin.so
# 生产环境下手工开启, set global audit_json_file=on;
# audit_json_file=1
```

max-connections 连接数
  max-connections 在 docker-compose 方式下通过 my.conf 配置有效

```
# 配合主从模式，每个 MySQL 需要配置不同值
server_id=1
log_bin=/var/log/mysql/mysql-bin.log
```

改为大小写敏感
```
lower_case_table_names = 0
```

monitor
===

prometheus
---

另外的方案采用 prometheus, 参考 
- `https://grafana.com/dashboards/893`
- `https://github.com/vegasbrianc/prometheus/blob/master/docker-compose.yml`

run
- mkdir data, chmod -R 777 data
- Run `docker-compose up -d`
- 第一次还不会成功，还有点权限问题，退出 docker-compose, `docker-compose stop`, `docker-compose rm`
- `cd data, chmod -R 777 grafana, chmod -R 777 prometheus`

influxdb
---

## 基本操作

- `CREATE DATABASE "cadvisor"`
- `CREATE USER 'cadvisor' WITH PASSWORD 'cadvisor'`
- `grant all privileges on "cadvisor" to "cadvisor"`
- `grant WRITE on "cadvisor" to "cadvisor"`
- `grant READ on "cadvisor" to "cadvisor"`

- 使用数据库, `use db_name`
- 显示该数据库中所有的表, `show measurements`
- 创建表，直接在插入数据的时候指定表名, `insert test,host=127.0.0.1,monitor_name=test count=1`
- 删除表, `drop measurement "measurement_name"`
- 查看数据库保存策略, 主要用于指定数据保留时间，超过指定时间，就删除这部分数据。`show retention policies on "db_name"`
    -  rp_name：策略名；
    - db_name：具体的数据库名；
    - 3w：保存3周，3周之前的数据将被删除，influxdb具有各种事件参数，比如：h（小时），d（天），w（星期）；
    - replication 1：副本个数，一般为1就可以了；
    - default：设置为默认策略

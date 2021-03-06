monitor
===

dockprom
---

暂时采用 dockprom 方案
- 默认 volumes 统一存放 `/var/lib/docker/volumes`
    ```
    volumes:
        prometheus_data: {}
        grafana_data: {}
    ```

    改为存放到当前目录

exporter
---

- [oracle exporter](https://github.com/iamseth/oracledb_exporter)
- [rabbitmq exporter](https://github.com/deadtrickster/prometheus_rabbitmq_exporter)
- [Spring Boot 应用可视化监控](https://www.jianshu.com/p/7ecb57a3f326)

grafana
---

- [3.0 汉化](https://github.com/moonstack/grafana-for-chinese)

prometheus
---

base2

另外的方案采用 prometheus, 参考 
- [Docker hosts and containers monitoring with Prometheus, Grafana, cAdvisor, NodeExporter and AlertManager](https://github.com/stefanprodan/dockprom)
- prometheus
    - `https://github.com/vegasbrianc/prometheus`
    - [prometheus,文档参考](https://songjiayang.gitbooks.io/prometheus/container/docker.html)
    - [gitbook](https://github.com/songjiayang/prometheus_practice)

run
- mkdir data, chmod -R 777 data
- Run `docker-compose up -d`
- 第一次还不会成功，还有点权限问题，退出 docker-compose, `docker-compose stop`, `docker-compose rm`
- `cd data, chmod -R 777 grafana, chmod -R 777 prometheus`

查看 
- cadvisor: http://ip:8081
- prometheus: http://ip:9090/status, targets

监测点: prometheus.yml
- 'localhost:9090', 'node-exporter:9100'
- '127.0.0.1:8081', 

in grafana container: docker exec -it grafana /bin/bash

## 问题

promethues 访问不了 cadvisor
- `docker inspect monitoring_cadvisor`, 发现没有ip 地址
- `docker inspect monitoring_prometheus`, Networks - dockermonitor_default - IPAddress 
- 解决，取消 promethues depends on cadvisor，运行后再次查看以上信息已有ip
    - 但只能通过容器地址访问，暂时不能访问局域网内其他服务状态

influxdb
---

base

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

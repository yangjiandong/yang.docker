## Setup Greenplum6 Cluster

- [3分钟快速搭建Greenplum集群](https://cn.greenplum.org/build_greenplum_cluster/)
- save，docker 生成文件，考虑作为映射

### run

Start container, `docker-compose up -d`
```bash
# 登陆master节点
ssh -p 6222 gpadmin@127.0.0.1
# 或者 ssh -p 6222 gpadmin@0.0.0.0
# 密码: changeme

# 初始化配置文件，不需要做，已在 .bash_profile
# source /usr/local/greenplum-db/greenplum_path.sh

# 配置greenplum文件
artifact/prepare.sh -s 2 -n 2
# -s: segment(容器)的个数
# -n: 每个segment(容器)上primary的个数

# 初始化集群，会生成env.sh 文件(greenplum所需的环境变量)
source env.sh
gpinitsystem -a -c gpinitsystem_config

# 开启远程无密码访问，? 还没做
artifact/postinstall.sh

```

```bash
# 查看安装结果
[gpadmin@mdw ~]$ ps -ef | grep postgres
gpadmin   2589     1  0 13:29 ?        00:00:00 /usr/local/greenplum-db-6.14.1/bin/postgres -D /home/gpadmin/master/gpseg-1 -p 5432 -E
gpadmin   2590  2589  0 13:29 ?        00:00:00 postgres:  5432, master logger process
gpadmin   2594  2589  0 13:29 ?        00:00:00 postgres:  5432, checkpointer process
gpadmin   2595  2589  0 13:29 ?        00:00:00 postgres:  5432, writer process
gpadmin   2596  2589  0 13:29 ?        00:00:00 postgres:  5432, wal writer process
gpadmin   2597  2589  0 13:29 ?        00:00:00 postgres:  5432, stats collector process
gpadmin   2598  2589  0 13:29 ?        00:00:00 postgres:  5432, bgworker: dtx recovery process
gpadmin   2599  2589  0 13:29 ?        00:00:00 postgres:  5432, bgworker: ftsprobe process
gpadmin   2602  2589  0 13:29 ?        00:00:00 postgres:  5432, bgworker: sweeper process
gpadmin   2735    19  0 13:38 pts/0    00:00:00 grep --color=auto postgres
```

Now you can access your Greenplu with psql or other clients.

### Manage cluster

```
source env.sh
gpstop -a
gpstart -a
```


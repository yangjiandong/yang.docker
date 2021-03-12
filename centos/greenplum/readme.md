## Setup Greenplum6 Cluster

- [3分钟快速搭建Greenplum集群](https://cn.greenplum.org/build_greenplum_cluster/)
- build
- run
  Default cluster has 1 master, 2 segment and 1 etl host. you can change it by editing the docker-compose.yaml file.
  Start container, `docker-compose up -d`
- Login to cluster
  ssh -p 6222 gpadmin@127.0.0.1
  Password is changeme
- Config greenplum file
  ```
  artifact/prepare.sh -s 2 -n 2
  ```
  -s 表示有2个segment机器（sdw1 to sdw2）
  -n 表示在每个segment机器上创建2个primary节点
- start
  It will create config file for gpinitsystem. Run following command:
  ```
  gpinitsystem -a -c gpinitsystem_config
  ```
  show env.sh
  ```
  source /usr/local/greenplum-db/greenplum_path.sh
  SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export MASTER_DATA_DIRECTORY=$SRCDIR/master/gpseg-1
  export PGPORT=5432
  export PGHOST=
  export PGDATABASE=test
  ```
- use sosedoff/pgweb client
  ```
  docker run -d -p 6081:8081 --name pgweb sosedoff/pgweb
  ```

Now you can access your Greenplu with psql or other clients.
*** Manage cluster
Script **prepare.sh**  will also create file **env.sh** that we can source for Greenplum enviroments.
#+BEGIN_SRC bash
source env.sh
gpstop -a
gpstart -a
#+END_SRC

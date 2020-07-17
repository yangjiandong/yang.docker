## MySQL TPCC

docker
- one/java:8
- one/mysql-ssh:5.7

BenchMarkSQL 工具: tpcc.zip

### start mysql docker

```
docker run --name mysql5.7 \
    -v $(pwd)/mysql5.7:/var/lib/mysql \
    -v $(pwd)/run:/var/run/mysqld \
    -v $(pwd)/conf:/etc/mysql \
    -v $(pwd)/plugin/audit/libaudit_plugin.so:/usr/lib/mysql/plugin/libaudit_plugin.so \
    -v $(pwd)/rsa/authorized_keys:/root/.ssh/authorized_keys \
    -p 3306:3306 \
    -p 22:22 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    -d \
    one/mysql-ssh:5.7 --max-connections=500
```

- create database demo
- 如果要打开审计功能，`set global audit_json_file=on;`
- start sshd
  ```
  docker exec -it mysql5.7 bash
  ```
  进入容器
  ```
  /root/run.sh
  ```

### start java docker

```
docker run --rm \
    -it \
    --sysctl net.ipv4.ip_local_port_range="8001 65000" \
    -e JAVA_OPTS='-Xms 1g -Xmx 2g' \
    -v $(pwd)/ssh:/root/.ssh \
    -v $(pwd)/tpcc:/workspace \
    --name jtpcc \
    one/java:8 \
    /bin/bash
```

- tpcc 下存放 BenchMarkSQL 测试工具，dist、lib、run
- 配置测试数据源，tpcc/run/my.mysql

### 增加ssh 私公钥，方便 ssh 免密码登录 mysql

- one/java 容器中操作
  ```
  ssh-keygen -t rsa
  #按回车选择默认的没有密码。此时，会在生成一个文件~/.ssh/id_rsa.pub
  ```
  注意，该文件就在当前 ssh 目录下。提供的 docker 文件中已提供。
- 添加 one/java 公钥到 one/mysql 下
  ```
  # 以下只是示例，但 authorized_keys 的位置在 /root/.ssh 下
  cat ~/.ssh/id_rsa.pub >authorized_keys
  ```
  也可以在外部通过编辑软件直接拷贝内容到 `authorized_keys`

### tpcc 测试

在 one/java 容器中操作

```
cd worspace
cd run
./runDatabaseBuild.sh my.mysql
./runBenchmark.sh my.mysql
```

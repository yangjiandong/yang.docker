centos 7.x
---

- show version: `cat /etc/redhat-release`
- show kernal: `uname -a`

### base on million12/centos-supervisor:4.0.2

- one/centos:7
  - run.sh
  - in other shell, ssh root@localhost -p 4426, password 123456
- centos-supervisor:4.0.2 相关配置

  ```
  ADD container-files /
  VOLUME ["/data"]
  ENTRYPOINT ["/config/bootstrap.sh"]
  EXPOSE 9111
  ```

- 启动命令
  - container-base.files/config/bootstrap.sh
- supervisorctl, [inet_http_server]
  - port = :9111
  - username = sv
  - password = password
- 增加项目
  - ssh, user: root,123456
  - croni

### use vscode remote ssh 功能

#### use one/centos:7

- one/centos:7
  - run.sh

  ```
  docker run --rm -it \
  -e TZ=Asia/Shanghai \
  -p 4426:22 \
  -p 9111:9111 \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
  --privileged=true \
  --name centos7 \
  one/centos:7
  ```

#### 设置免密登录

- 本地

  ```
  cd ~/.ssh
  ssh-keygen -b 4096 -t rsa
  # 回车、密码留空
  ```

- in one/centos:7 container

  ```
  cd
  mkdir .ssh
  touch .ssh/authorized_keys
  # x is 本地 ~/.ssh/id_rsa.pub 内容， use cat id_rsa.pub show infos
  echo "x" > .ssh/authorized_keys
  chmod 700 ~/.ssh/
  chmod 600 ~/.ssh/authorized_keys
  ```

  再重新 ssh 连接

#### ssh/authorized_keys

- 包含 mac mini 机器生成的key

### one/centos:7 操作说明

- ssh,port 22, user:root,123456
- supervisorctl, 9111, user: sv, password

### one/nginx:1.12

- base one/centos:7
- logrotate, 日志处理，按天归档
- cron
- 监测 /etc/nginx 目录，更改配置后不用手工重启

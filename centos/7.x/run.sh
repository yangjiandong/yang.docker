#! /bin/bash
# 不支持 sshd, 需手工启动
# 1. in container run: /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
# 2. in other shell, ssh root@localhost -p 4426, password 123456

# invalid argument "fs.file-max=65535" for "--sysctl" flag: sysctl 'fs.file-max=65535' is not whitelisted
# See 'docker run --help'

# 系统最大文件描述符, `sysctl -a | grep file-max`
# 查看端口 in container, `cat /proc/sys/net/ipv4/ip_local_port_range`,`sysctl -a | grep ipv4.ip_local_port_range`
# 用户最大文件描述符和最大进程数 `ulimit -n`, `ulimit -u`

docker run --rm -it \
  -e TZ=Asia/Shanghai \
  -p 4426:22 \
  -p 9111:9111 \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
  --privileged=true \
  -v $(pwd)/work:/workspace \
  --name centos7 \
  one/centos:7

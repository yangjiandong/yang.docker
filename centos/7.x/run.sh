#! /bin/bash
# 不支持 sshd, 需手工启动
# 1. in container run: /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
# 2. in other shell, ssh root@localhost -p 4426, password 123456

docker run --rm -it \
  -e TZ=Asia/Shanghai \
  -p 4426:22 \
  --privileged=true \
  one/centos:7.6 /bin/bash

#! /bin/bash
# 测试 sshd
# 1. in container run: /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
# 2. in other shell, ssh root@localhost -p 4426, password 123456

docker run --rm -it \
  -p 4426:22 \
  --privileged=true \
  one/centos:7.6 /bin/bash

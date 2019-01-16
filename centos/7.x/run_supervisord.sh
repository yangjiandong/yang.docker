#! /bin/bash
# sshd
# in other shell, ssh root@localhost -p 4426, password 123456

docker run -i -t -d \
  -p 4426:22 \
  --name centos7.supervisor one/centos:7.6

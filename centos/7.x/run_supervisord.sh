#! /bin/bash
# sshd
# in other shell, ssh root@localhost -p 4426, password 123456

docker run --rm -it \
  -e TZ=Asia/Shanghai \
  -p 4446:22 \
  -p 9112:9111 \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
  --privileged=true \
  --name centos7.supervisor million12/centos-supervisor:4.0.2

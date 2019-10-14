  # -p 4426:22 \
  # -p 9111:9111 \
docker run --rm -it \
  -e TZ=Asia/Shanghai \
  --sysctl net.ipv4.ip_local_port_range="1024 65535" \
  --ulimit nofile=65536:65536 \
  --privileged=true \
  -v $(pwd)/work:/work \
  --name percona \
  one/percona:3.1.1

#! /bin/bash
# openresty/openresty:1.13.6.2-centos
# docker run \
#     -d \
#     --name openresty \
#     -e TZ=Asia/Shanghai \
#     -v $(pwd)/conf:/usr/local/openresty/nginx/conf:ro \
#     -v $(pwd)/conf.d:/etc/nginx/conf.d:ro \
#     -v $(pwd)/logs:/var/log/nginx \
#     -v $(pwd)/www:/usr/local/openresty/nginx/html \
#     -v $(pwd)/workspace:/app \
#     -p 8088:80 -p 4426:22 \
#     one/openresty:1.13.6

# sshd,-p 4426:22 \
docker run \
    --rm \
    -it \
    --name nginx \
    -p 8888:80 \
    -p 4426:22 \
    -p 9111:9111 \
    --sysctl net.ipv4.ip_local_port_range="1024 65535" \
    --ulimit nofile=65536:65536 \
    --privileged=true \
    -v $(pwd)/conf:/etc/nginx:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -v $(pwd)/www:/usr/share/nginx/html \
    -v $(pwd)/static://usr/share/nginx/html/front/static \
    one/nginx:1.12

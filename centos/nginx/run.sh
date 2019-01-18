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
    -d \
    --name nginx \
    -p 8888:80 \
    -v $(pwd)/conf:/etc/nginx:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -v $(pwd)/www:/usr/share/nginx/html \
    -v $(pwd)/workspace:/app \
    one/nginx:1.12

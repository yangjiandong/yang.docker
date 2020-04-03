#! /bin/bash
# openresty/openresty:1.13.6.2-centos
docker run \
    --rm -it \
    --name openresty \
    -e TZ=Asia/Shanghai \
    -v $(pwd)/conf:/usr/local/openresty/nginx/conf:ro \
    -v $(pwd)/conf.d:/etc/nginx/conf.d:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -v $(pwd)/www:/usr/local/openresty/nginx/html \
    -v $(pwd)/workspace:/app \
    -v $(pwd)/static:/usr/local/openresty/nginx/html/front/static \
    -p 8088:80 -p 4436:22 \
    one/openresty:1.15.8

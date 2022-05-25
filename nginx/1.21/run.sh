docker run \
    --name nginx-1.21 \
    -p 8888:80 \
    -e TZ=Asia/Shanghai \
    --privileged=true \
    -v $(pwd)/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
    -v $(pwd)/nginx/conf.d:/etc/nginx/conf.d:ro \
    -v $(pwd)/nginx/www:/usr/share/nginx/html \
    -v $(pwd)/logs:/var/log/nginx \
    -d one/nginx:1.21

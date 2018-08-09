docker run \
    --name nginx \
    -p 8888:80 \
    -e TZ=Asia/Shanghai \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf:ro \
    -v $(pwd)/conf:/etc/nginx/conf.d:ro \
    -v $(pwd)/logs:/var/log/nginx \
    -v $(pwd)/www:/usr/share/nginx/html \
    -v $(pwd)/bin:/workspace \
    -v $(pwd)/crontab:/etc/cron.d/crontab \
    -d one/nginx:1.14

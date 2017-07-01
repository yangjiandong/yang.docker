
docker run \
    --name alisql \
    -p 3306:3306 \
    -v $(pwd)/mysql:/var/lib/mysql \
    -v $(pwd)/conf:/etc/mysql \
    -e MYSQL_ROOT_PASSWORD=123 \
    -d \
    registry.cn-hangzhou.aliyuncs.com/acs-sample/alisql:latest

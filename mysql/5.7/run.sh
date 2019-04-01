
# max-connections 在 docker-compose 方式下通过 my.conf 配置有效
docker run --name mysql5.7 \
    -v $(pwd)/mysql5.7:/var/lib/mysql \
    -v $(pwd)/mysql5.7/run:/var/run/mysqld \
    -v $(pwd)/conf:/etc/mysql \
    -p 3306:3306 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    -d \
    one/mysql:5.7
    --max-connections=500

# on centos7
# docker run --name mysql \
#     -v $(pwd)/conf/my.cnf:/etc/mysql/my.cnf:ro \
#     -v $(pwd)/mysql:/var/lib/mysql:rw \
#     --privileged=true \
#     -p 3306:3306 \
#     -e 'MYSQL_ROOT_PASSWORD=123' \
#     -d \
#     one/mysql:5.7 \
      # --max-connections=500
      # --character-set-server=utf8mb4
      # --collation-server=utf8mb4_unicode_ci


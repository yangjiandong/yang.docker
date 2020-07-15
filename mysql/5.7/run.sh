
# max-connections 在 docker-compose 方式下通过 my.conf 配置有效
# --max-connections=500, use show variables like 'max_connections';show global status like 'Max_used_connections';
# ? mac 下 docker 有效
docker run --name mysql5.7 \
    -v $(pwd)/mysql5.7:/var/lib/mysql \
    -v $(pwd)/run:/var/run/mysqld \
    -v $(pwd)/conf:/etc/mysql \
    -v $(pwd)/plugin/audit/libaudit_plugin.so:/usr/lib/mysql/plugin/libaudit_plugin.so \
    -v $(pwd)/rsa/authorized_keys:/root/.ssh/authorized_keys \
    -p 3306:3306 \
    -p 22:22 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    -d \
    one/mysql-ssh:5.7 --max-connections=500

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


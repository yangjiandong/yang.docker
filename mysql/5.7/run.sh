
docker run --name mysql5.7 \
    -v $(pwd)/mysql5.7:/var/lib/mysql \
    -v $(pwd)/mysql5.7/run:/var/run/mysqld \
    -v $(pwd)/conf:/etc/mysql \
    -p 3306:3306 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    -d \
    one/mysql:5.7



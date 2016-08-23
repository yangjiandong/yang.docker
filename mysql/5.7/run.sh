docker run --name mysql \
    -v ~/mysql_data/data \
    -p 3306:3306 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    yangjiandong/mysql:5.7


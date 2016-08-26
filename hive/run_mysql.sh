docker run --name mysql \
    -h mysql \
    -e 'DB_NAME=hive' \
    -e 'DB_REMOTE_ROOT_NAME=root' \
    -e 'DB_REMOTE_ROOT_PASS=123' \
    -v ~/mysql_data/data:/var/lib/mysql \
    -p 3306:3306 -d \
    yangjiandong/mysql:5.5


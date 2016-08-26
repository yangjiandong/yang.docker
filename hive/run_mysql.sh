docker run --name mysql \
    -h mysql \
    -e 'DB_NAME=hive' \
    -e 'DB_USER=root' \
    -e 'DB_PASS=123' \
    -e 'MYSQL_CHARSET=latin1' \
    -e 'MYSQL_COLLATION=latin1_swedish_ci' \
    -v ~/workspace/docker/yang.docker/hive/db:/var/lib/mysql \
    -p 3306:3306 -d \
    yangjiandong/mysql:5.5


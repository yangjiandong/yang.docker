docker run --name mysql5.7 \
    -v $(pwd)/mysql5.7:/var/lib/mysql \
    -v $(pwd)/conf:/etc/mysql \
    -p 3336:3306 \
    -e 'MYSQL_ROOT_PASSWORD=123' \
    -d \
    one/mysql:5.7
    # mysql:5.7.18

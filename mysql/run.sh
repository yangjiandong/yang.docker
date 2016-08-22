#docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d yangjiandong/mysql:5.5

# remote user,pwd
#DB_REMOTE_ROOT_HOST
#  -e 'DB_REMOTE_ROOT_NAME=root' -e 'DB_REMOTE_ROOT_PASS=123' \
docker run --name mysql \
    -e 'DB_REMOTE_ROOT_HOST=192.168.99.1' -e 'DB_REMOTE_ROOT_NAME=root' -e 'DB_REMOTE_ROOT_PASS=123' \
    -v ~/mysql_data/data:/var/lib/mysql \
    -p 3306:3306 -d \
    yangjiandong/mysql:5.5


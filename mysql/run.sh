#docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d yangjiandong/mysql:5.5

# remote user,pwd
#DB_REMOTE_ROOT_HOST
docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d \
  -e 'DB_REMOTE_ROOT_NAME=root' -e 'DB_REMOTE_ROOT_PASS=123' \
  yangjiandong/mysql:5.5


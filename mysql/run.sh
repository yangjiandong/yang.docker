# chmod 777 data
docker run --name mysql-5.7 -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123 -d mysql:5.7

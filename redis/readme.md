redis
===

### redis

建议采用 yangjiandong/redis:3.2 or 3/run_redis.sh

### create docker

http://littlespit.me/docker-learning-note.html

### get docker

docker pull redis:3.0.3

### run

运行服务：

```
docker run --name redis -d -p 6379:6379 redis:3.0.3 -v ~/workspace/docker/redis-data:/data
or
docker run --name redis -p 6379:6379 -dv /Users/yangjiandong/workspace/docker/redis-data:/data -w /data  yangjiandong/redis redis-server

```
参数说明：

--name是给container取一个别名，以后再stop和attach的时候就可以使用这个别名，
-d 是作为一个后台服务运行，
-p是端口映射，把container的6379映射到host的6379端口，
这样就可以在host机上使用192.168.59.103:6379来连接container中的redis服务了。

查看docker 容器配置

```
docker inspect xxxxx
```

访问

```
docker-machine env default
# ip 192.168.99.100
redis-cli -h 192.168.99.100
```
另一个容器访问 redis

```
docker run --link redis:db --rm -i -t yangjiandong/base /bin/bash
sudo apt-get install redis-server
service redis-server stop

$ redis-cli -h $DB_PORT_6379_TCP_ADDR
$ redis 172.17.0.33:6379>
$ redis 172.17.0.33:6379> set docker awesome
OK
$ redis 172.17.0.33:6379> get docker
"awesome"
$ redis 172.17.0.33:6379> exit
```

参数说明：

--rm Automatically remove the container when it exits

### todo



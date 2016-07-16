Docker
===

### 07.16

在 `yangjiandong/openresty` 基础上安装 `ffmpeg`， 准备安装[nginx+rtmp服务器](http://www.jianshu.com/p/02222073b3f1)

[centos7 install ffmpeg](http://www.icnws.com/articles/2016/02/29/1456739902248.html)

```
run yangjiandong/openresty
yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel
```

commit to yangjiandong/openresty_ffmpeg image
```
docker ps
docker commit 336600fa7f5c yangjiandong/openresty_ffmpeg
```

### 07.12

add openresty docker

[1](https://github.com/openresty/docker-openresty)

### 07.07

```
Error checking TLS connection: Error checking and/or regenerating the certs: There was an error validating certificates for host "192.168.99.100:2376": tls: DialWithDialer timed out
```

升级了 docker-toolbox 1.11 出现以上问题
[1](http://miroadamy.com/2016/03/docker-machine-error-after-upgrade)
```
docker-machine rm default
docker-machine create --driver virtualbox default
```

以前的docker image 就没有了

#### Alpine

最小的docker 镜像

### 06.17

#### elasticsearch

- [elasticsearch](http://segmentfault.com/a/1190000003111556?utm_source=Weibo&utm_medium=shareLink&utm_campaign=socialShare)

    ```
sudo docker run -d -p 9200:9200 -p 9300:9300 elasticsearch
```

- [Elasticsearch, Logstash, Kibana (ELK) Docker image documentation](https://elk-docker.readthedocs.io)

    For instance, the image containing Elasticsearch 1.7.3, Logstash 1.5.5, and Kibana 4.1.2 (which is the last image using the Elasticsearch 1.x and Logstash 1.x branches) bears the tag E1L1K4

    ```
docker pull sebp/elk:E1L1K4
docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -p 5000:5000 -it --name elk sebp/elk:E1L1K4
# access 192.168.99.100:5601 kibana web interface
# lastest
docker pull sebp/elk
```

    ```
docker exec -it elk /bin/bash
/opt/logstash/bin/logstash -e 'input { stdin { } } output { elasticsearch { host => localhost } }'
#192.168.99.100:9200/_search?pretty 
```

[github source](https://github.com/spujadas/elk-docker)

- [logstash elasticsearch kibana日志集中解决方案](http://my.oschina.net/chaun/blog/670928)

### 05.28

docker 访问问题，虽然`docker inspect redis | grep IPA` 查看到了IP，但访问不了，只能访问 `docker-machine env default` 显示的ip

### 2016.02.22

rabbitmq

[参考](https://coderwall.com/p/uqp34w/install-rabbitmq-via-docker-in-os-x)

- docker ip `192.168.99.100`
- `docker pull rabbitmq:3.6.0-management`
- `docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_DEFAULT_USER=admin -e RABBITMQ_DEFAULT_PASS=123 --name rabbitmq rabbitmq:3.6.0-management`, docker start rabbitmq
- `http://192.168.99.100:15672/`

### 12.09

```
docker run \
    --name fusion1api \
    --restart unless-stopped \
    --net=myapp \
    -d \
    -e MODULE=fusion \
    -v $FPATH/fusion1_api:/opt/django/app \
    fangzx/py27prd:3.0
```

反向代理我也用容器，配置文件中就直接可以用其他容器的名字

反向代理的容器运行命令

```
docker run \
    --name nrp \
    --net=myapp \
    --restart unless-stopped \
    -p 80:80 \
    -p 443:443 \
    -v $FPATH/logs:/var/log/nginx \
    -v $FPATH/conf/default.conf:/etc/nginx/conf.d/default.conf \
    -v $FPATH/conf/nginx.conf:/etc/nginx/nginx.conf \
    -v $FPATH/certs:/etc/nginx/certs \
    -d \
    fangzx/nginxreverseproxy:1.0
```

- [豆瓣 code](https://github.com/douban/code)

You can use code

```
$docker pull dongweiming/code
or just build locally(recommended):
$cd code
$docker build -t code .
```

And launch a bash shell inside the container

```
$docker run -d -p 8080:8000 code gunicorn -w 2 -b 0.0.0.0:8000 app:app  # start app
5cf0d1f6a421c53d54662df77dd142978d24b8c76fd72ce1c106506458e1304a
$boot2docker ip
192.168.59.103
# go web http://192.168.59.103:8080
$docker run -t -i code /bin/bash
```

- error

    ```
docker dial tcp 192.168.99.100:2376: getsockopt: connection refused
    ```

    解决:

    ```
docker-machine stop default
docker-machine start default
    ```

### 12.08

- mac 采用 docker toolbox

    ```
docker-machine create -d virtualbox --virtualbox-boot2docker-url boot2docker.iso default
    ```

- java7base 无效

- [参考](https://hub.docker.com/r/stephenreed/jenkins-java8-maven-git/~/dockerfile/), java8base 增加了 jenkins

  - `docker-machine ip default`
  - brower to `http://ip:8080`

  > 注意：如果你在 OS X windows或者Linux上使用 boot2docker 虚拟机，你需要获取虚拟机的 ip 来代替localhost 使用，你可以通过运行 boot2docker shell 来获取 ip。

### 2015.08.26

#### redis


- get docker

    ```
docker pull redis:3.0.3
    ```

- run

    运行服务：

    ```
docker run --name redis -d -p 6379:6379 redis:3.0.3 -v ~/workspace/docker/redis-data:/data
    ```

    参数说明：
    
    - name是给container取一个别名，以后再stop和attach的时候就可以使用这个别名，
    - d 是作为一个后台服务运行，
    - p是端口映射，把container的6379映射到host的6379端口，

    这样就可以在host机上使用192.168.59.103:6379来连接container中的redis服务了。

    另一个容器访问 redis:

    ```
docker run --link redis:db --rm -i -t ubuntu:14.04 /bin/bash
    ```

    参数说明：

    - rm Automatically remove the container when it exits


### 2015.08.20

### create new image

`docker ps` - show container id
`docker commit <container id> images-id` - 可以覆盖原有images

### export,save

```
# 容器的导出
docker export <CONTAINER ID> > /home/export.tar
```

```
# 保存镜像到文件，方便在另外机器上安装
docker save image_name > filename.tar
# 还原
docker load < filename.tar
```

### error

`An error occurred trying to connect: Get https://192.168.59.103:2376/v1.19/containers/json: x509: certificate is valid for 127.0.0.1, 10.0.2.15, not 192.168.59.103`

```
boot2docker ssh 'sudo /etc/init.d/docker restart'
```

### Remove all untagged images

```
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

```



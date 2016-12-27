Docker
===

说明
---

```
ubuntu:14.04 --> yangjiandong/base:v1 --> yangjiandong/java8base:v1

tianon/centos:6.5 --> yangjiandong/java8centos --> yangjiandong/hadoop:2.6.0
```

12.02
---

### nodejs

采用 node/base

11.03
---

### docker 考虑磁盘容量

```
docker-machine create --virtualbox-disk-size "50000" --virtualbox-memory "4096" -d virtualbox dev
```

09.29
---

### git 删除历史文件

- 步骤一: 从你的资料库中清除文件
```
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch path-to-your-remove-file' --prune-empty --tag-name-filter cat -- --all
#如果你看到类似下面这样的, 就说明删除成功了:
Rewrite 48dc599c80e20527ed902928085e7861e6b3cbe6 (266/266)
# Ref 'refs/heads/master' was rewritten
```
- 推送我们修改后的repo
```
git push origin master --force
```
- 步骤三: 清理和回收空间
```
rm -rf .git/refs/original/

git reflog expire --expire=now --all

git gc --prune=now
Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (1378/1378), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1461), reused 1802 (delta 1048)
git gc --aggressive --prune=now
Counting objects: 2437, done.
# Delta compression using up to 4 threads.
# Compressing objects: 100% (2426/2426), done.
# Writing objects: 100% (2437/2437), done.
# Total 2437 (delta 1483), reused 0 (delta 0)
```

09.14
---

### [phusion base image](https://github.com/phusion/baseimage-docker)

A minimal Ubuntu base image modified for Docker-friendliness

create base:v3

09.02
---

### elasticsearch 2.4

```
chmod +x docker-entrypoint.sh
mkdir esdata
chmod 777 esdata 
```

### Elasticsearch, Logstash, Kibana (ELK) Docker image

- [github](https://github.com/spujadas/elk-docker)
- [docs](https://elk-docker.readthedocs.io/)
- elasticsearch/elk-docker/ 

```
$ sudo docker run -p 5601:5601 -p 9200:9200  -p 5044:5044 -p 5000:5000 \
    -v elk-data:/var/lib/elasticsearch --name elk sebp/elk
```

- 5601 (Kibana web interface).
- 9200 (Elasticsearch JSON interface).
- 9300 (Elasticsearch transport interface).
- 5044 (Logstash Beats interface, receives logs from Beats such as Filebeat – see the Forwarding logs with Filebeat section).
- 5000 (Logstash Lumberjack interface, receives logs from Logstash forwarders – see the Forwarding logs with Logstash forwarder section).

### Elk last

- [github](https://github.com/deviantony/docker-elk)
- elasticsearch/elk-docker-2
- [infos](http://www.infoq.com/cn/news/2016/08/Elasticsearch-5-0-Elastic)

08.29
---

### openresty add php5.6

08.25
---

### 容器间通讯

`-h HOSTNAME or --hostname=HOSTNAME` 设定容器的主机名，它会被写到容器内的 `/etc/hostname` 和 `/etc/hosts`。但它在容器外部看不到，既不会在 docker ps 中显示，也不会在其他的容器的 `/etc/hosts` 看到。

`--link=CONTAINER_NAME:ALIAS` 选项会在创建容器的时候，添加一个其他容器的主机名到 `/etc/hosts` 文件中，让新容器的进程可以使用主机名 ALIAS 就可以连接它。

`--dns=IP_ADDRESS` 添加 DNS 服务器到容器的 `/etc/resolv.conf` 中，让容器用这个服务器来解析所有不在 `/etc/hosts` 中的主机名。

`--dns-search=DOMAIN` 设定容器的搜索域，当设定搜索域为 `.example.com` 时，在搜索一个名为 host 的主机时，DNS 不仅搜索host，还会搜索 `host.example.com`。 注意：如果没有上述最后 2 个选项，Docker 会默认用主机上的 `/etc/resolv.conf` 来配置容器。

08.23
---

### ubuntu time

You can make this change permanent for yourself by appending the line
       	TZ='Asia/Shanghai'; export TZ
to the file '.profile' in your home directory; then log out and log in again.

Here is that TZ value again, this time on standard output so that you
can use the /usr/bin/tzselect command in shell scripts:
Asia/Shanghai

08.12
---

### spark 1.6

[参考](https://hub.docker.com/r/sequenceiq/spark/builds/birjne8ndykylp5si7u5qmt/)
[1.6](https://hub.docker.com/r/sequenceiq/spark/tags/)

Hadoop 2.6.0 and Apache Spark v1.6.0 on Centos

参考[1](https://github.com/sequenceiq/docker-spark) 构建自己的docker, 不能运行，还是采用官方镜像`docker pull sequenceiq/spark:1.6.0`

- create java8/sprark:1.6.0 base sequenceiq/spark:1.6.0

```
# install java8
### Install Java with Alternatives
### dowload soft/jdk-8u66-linux-x64.tar.gz

tar xvf jdk-8u66-linux-x64.tar.gz /usr/java

After extracting Java archive file, we just need to set up to use newer version of Java using alternatives. Use the following commands to do it.

# cd /usr/java/jdk1.8.xx
# alternatives --install /usr/bin/java java /usr/java/jdk1.8.xx/bin/java 2
# alternatives --config java

Now you may also required to set up javac and jar commands path using alternatives command.

# alternatives --install /usr/bin/jar jar /usr/java/jdk1.8.xx/bin/jar 2
# alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.xx/bin/javac 2
# alternatives --set jar /usr/java/jdk1.8.xx/bin/jar
# alternatives --set javac /usr/java/jdk1.8.xx/bin/javac

### Check Installed Java Version

Uses following command to check which version of Java is currently being used by system.

# java -version

javaca version "1.8.xx"
```

- run

```
#spark/run.sh
docker run --name master -it -p 8088:8088 -p 8042:8042 -p 50070:50070 -p 8085:8080 -p 4040:4040 -p 7077:7077 -p 2022:22  -v ~/data:/data -v ~/data/log:/usr/local/hadoop/logs -h master java8/spark:1.6.0 bash
```

08.06
---

### docker 加速

[DaoCloud](https://dashboard.daocloud.io/)
user:youngjiandong@sina.cn,qazwsx

```
Docker Toolbox 
docker-machine ssh default
sudo sed -i "s|EXTRA_ARGS='|EXTRA_ARGS='--registry-mirror=http://2c661460.m.daocloud.io |g" /var/lib/boot2docker/profile
exit
docker-machine restart default
```

### mysql

http://siddontang.com/2015/01/09/docker-practise/

Run the mysql image
```
docker run --name mysql -d yangjiandong/mysql:5.5
```
 
You can access the mysql server as the root user using the following command:
```
docker run -it --rm --volumes-from=mysql yangjiandong/mysql:5.5 mysql -uroot
```

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123' WITH GRANT OPTION;
flush privileges;

- 解决mac下 mysql 权限问题

[参考](http://www.cnblogs.com/yjmyzz/p/run-mysql-in-docker-using-mac.html)
[2](http://stackoverflow.com/questions/34442831/permission-denied-when-mounting-docker-volume-in-osx)

Dockerfile
```
RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chmod -R 777 /var/lib/mysql
```

mysql data store dir
```
cd
mkdir -p mysql_data/data
chmod 777 mysql_data
```

run.sh
```
docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d yangjiandong/mysql:latest
```

in run mysql container
```
docker exec -it mysql /bin/bash
```

07.28
---

[局域网访问docker](http://www.jscon.cc/docker-serial-2/)

virtualbox 网络设置 - 网络地址转换 - 端口转发 add
```
nginx tcp 192.168.1.109 8080  8080
```

redis.dev - 可以用的redis

07.20
---

json-server 修改了json需重新启动
```
docker stop my-json-server
docker rm my-josn-server
```

add `--watch` 好像没效果

old
---

### 07.18

config nginx + rtmp
```
copy install_rtmp_module.sh to /app
run docker
./install_rtmp_module
```

### 07.16

在 `yangjiandong/openresty` 基础上安装 `ffmpeg`， 准备安装[nginx+rtmp服务器](http://www.jianshu.com/p/02222073b3f1)

参考
- [centos7 install ffmpeg](http://www.icnws.com/articles/2016/02/29/1456739902248.html)
- [2](http://www.yaosansi.com/post/ffmpeg-on-centos/)

```
run yangjiandong/openresty
yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel
```

commit to yangjiandong/openresty_ffmpeg image
```
docker ps
docker commit 336600fa7f5c yangjiandong/openresty_ffmpeg
```

```
install libvpx 出现Neither yasm nor nasm have been found
解决
./configure --prefix="$HOME/ffmpeg_build" --as=yasm --disable-examples

ffmpeg --version
ffmpeg: error while loading shared libraries: libmp3lame.so.0: cannot open shared object file: No such file or directory
解决
cd /
find -name libmp3lame.so.0
./root/ffmpeg_build/lib/libmp3lame.so.0
vi /etc/ld.so.conf,add
/root/ffmpeg_build/lib

ldconfig
```

test
```
ffmpeg -version
```

### 07.12

add openresty docker

[参考](https://github.com/openresty/docker-openresty)

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

- create new image

`docker ps` - show container id
`docker commit <container id> images-id` - 可以覆盖原有images

- export,save

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

- error

`An error occurred trying to connect: Get https://192.168.59.103:2376/v1.19/containers/json: x509: certificate is valid for 127.0.0.1, 10.0.2.15, not 192.168.59.103`

```
boot2docker ssh 'sudo /etc/init.d/docker restart'
```

- Remove all untagged images

```
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

```

- Stop / remove all Docker containers

```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

- 进入运行的容器

```
docker attach f357e2faab77
```
or

in run container
```
docker exec -it [container name] /bin/bash
```



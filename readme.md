Docker
===

### 12.09

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

#### [elasticsearch](http://segmentfault.com/a/1190000003111556?utm_source=Weibo&utm_medium=shareLink&utm_campaign=socialShare)

```
sudo docker run -d -p 9200:9200 -p 9300:9300 elasticsearch
```

### create new image

`docker ps` - show container id
`docker commit id images-id` - 可以覆盖原有images

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



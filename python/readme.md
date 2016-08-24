python django mysql
====

python-django-cd-sample
---

[参考](http://open.daocloud.io/ru-he-gou-jian-ju-you-chi-xu-jiao-fu-neng-li-de-docker-hua-django-ying-yong/)

## daocloud.io/redis:latest

```
  volumes:
    - ./redisdata:/data
```

## yangjiandong/mysql:5.5

采用 `yangjiandong/mysql:5.5`

```
mkdir -p db 
chmod 777 db 
```

步骤
- first run `docker-compose up`
- in container `docker exec -it pythondjangocdsample_web_1 /bin/bash`

```
cd /code
./manage.py syncdb
# admin:root,123
```

## docker-compose 

```
docker-compose build
docker-compose up
docker-compose ps
docker-compose ls
## stop and remove container 
docker-compose down
```

## mysql:lastest

mysql 数据暂时不能持久化到本地

**注意**,第一次需运行两遍，生成数据库

默认不持久化数据文件，能成功运行

create new app
---

# docker-compose.yml

## db标签 

images表示使用mysql镜像 

expose表示暴露端口3306，但不发布到宿主机上 

volume表示挂载宿主机的路径作为卷，冒号左边为宿主机路径，右边为镜像内路径 

environment为环境变量，每个容器都有自己定义的环境变量，具体查看镜像手册中的mysql

## web标签 

build指定建立Dockerfile路径 

command将覆盖默认的命令 

ports指定主机开放的端口 

links指向其他容器中的服务

# 构建镜像

`docker-compose build`

```
mkdir db mysite
chmod -R 777 db/
chmod -R 777 mysite/
```

# create django project

```
docker-compose run web django-admin.py startproject mysite ./mysite
```

```
docker-compose run web manage.py makemigrations
```

run

```
docker-compose up
```



python_app
===

docker-compose.yml
---

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

构建镜像
---

`docker-compose build`

```
mkdir db mysite
chmod -R 777 db/
chmod -R 777 mysite/
```

create django project
---

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


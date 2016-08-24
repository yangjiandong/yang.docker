python django mysql
====

python-django-cd-sample
---

[参考](http://open.daocloud.io/ru-he-gou-jian-ju-you-chi-xu-jiao-fu-neng-li-de-docker-hua-django-ying-yong/)

mysql 数据暂时不能持久化到本地

**注意**,第一次需运行两遍，生成数据库

默认不持久化数据文件，能成功

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




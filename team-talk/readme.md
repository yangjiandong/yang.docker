centos6.6
---

### remove nginx

ps -ef | grep nginx

### remove none image

docker rmi -f $(docker images | grep "^<none>" | awk "{print $3}")

### remove stopped containers

docker rm $(docker ps -a -q)

### python httpserver

python -m SimpleHTTPServer

### Q

unzip:  cannot find or open tt.zip, tt.zip.zip or tt.zip.ZIP

### save image

container中的内容在在container关闭之后都会丢失，所以当所有工作都做完之后，需要通过commit命令来提交修改，这样才能保存所有的内容。命令为：docker commit [CONTAINER-ID] [STATUS]，我们可以先用docker ps来得到正在运行的container的信息，然后输入命令docker commit c2982423f0c6 tutum/mysql:latest来提交最新的内容，保存到镜像中，最后通过ps images查看镜像

$ docker run --name redis -d -p 6379:6379 redis:3.0.3 redis-server --appendonly yes
b31073c4165a621e1823c4618103c344fdb19a12aa13752c20b083c5e167b101

docker inspect b31073c4165a621e1823c4618103c344fdb19a12aa13752c20b083c5e167b101
show ...


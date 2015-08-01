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

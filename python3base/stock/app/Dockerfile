FROM one/py3base-stock:3.6

WORKDIR /data

#增加服务端口就两个 6006 8500 9001
EXPOSE 8888 9999

#经常修改放到最后：
# ADD supervisor /data/supervisor

ENTRYPOINT ["supervisord","-n","-c","/data/supervisor/supervisord.conf"]

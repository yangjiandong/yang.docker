#
# Thanks: https://github.com/Krijger/docker-cookbooks/tree/master/supervisor
#
FROM ubuntu:14.04
MAINTAINER yangjiandong <59338947@qq.com>

ENV DEBIAN_FRONTEND noninteractive

# 使用 aliyuncs 的源
COPY sources.list.aliyuncs.txt /etc/apt/sources.list

# 保持系统最新
RUN apt-get -y update
RUN apt-get -y upgrade
RUN locale-gen zh_CN.UTF-8

# RUN apt-get install -y curl man software-properties-common unzip wget gcc fontconfig build-essential git

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

RUN         apt-get -y install redis-server
EXPOSE      6379
#ENTRYPOINT  ["/usr/bin/redis-server"]

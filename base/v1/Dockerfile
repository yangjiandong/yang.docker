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
ENV HOME /root

RUN apt-get install -y curl unzip wget gcc 

# supervisor installation and create directory for child images to store configuration in
RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

# remove download archive files
RUN apt-get clean

# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# default command (创建容器时执行)
CMD ["supervisord", "-c", "/etc/supervisor.conf"]

#EOP

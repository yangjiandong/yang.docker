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
RUN locale-gen en_US.UTF-8

RUN apt-get install -y curl man software-properties-common unzip wget gcc fontconfig build-essential git

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root

# supervisor installation and create directory for child images to store configuration in
RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# default command (创建容器时执行)
# CMD ["supervisord", "-c", "/etc/supervisor.conf"]

#EOP

FROM phusion/baseimage:0.9.19
MAINTAINER yangjiandong <59338947@qq.com>

RUN locale-gen zh_CN.UTF-8

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# 使用 aliyuncs 的源
COPY sources.list.aliyuncs.txt /etc/apt/sources.list

# 保持系统最新
# APT 自动安装 PHP 相关的依赖包，如需其他依赖包在此添加
# 用完包管理器后安排打扫卫生可以显著的减少镜像大小
RUN apt-get update \  
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# ...put your own build instructions here...

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

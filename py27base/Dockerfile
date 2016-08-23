FROM yangjiandong/base:v2

MAINTAINER yangjiandong <59338947@qq.com>

RUN apt-get update && \
    apt-get install -y \
    python-pip \
    libxml2-dev \
    libc6-dev \
    python2.7-dev \
    libpcre3 \
    libpcre3-dev \
    libgeoip1 \
    libgeoip-dev \
    libxslt1-dev \
    libjpeg62 \
    libjpeg62-dev \
    zlib1g-dev  \
    libfreetype6 \
    libfreetype6-dev \
    libmysqlclient-dev \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

#EOP

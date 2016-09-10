FROM yangjiandong/base:v2

MAINTAINER yangjiandong <59338947@qq.com>

RUN apt-get update && \
    apt-get install -y \
    python3-pip \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

#EOP

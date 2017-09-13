FROM yangjiandong/base:v3

COPY sources.txt /etc/apt/sources.list

RUN apt-get update && apt-get install -y \
    sqlite3 \
    libsqlite3-dev \
    python3-pip \
    # 用完包管理器后安排打扫卫生可以显著的减少镜像大小
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# COPY pip.conf ~/.pip/pip.conf
# PYPI repository location
ARG pypi_url=https://mirrors.aliyun.com/
# PYPI index location
ARG pypi_index_url=https://mirrors.aliyun.com/pypi/simple

RUN mkdir ~/.pip && \
    echo "[global]" > ~/.pip/pip.conf && \
    echo "index = $pypi_url" >> ~/.pip/pip.conf && \
    echo "index-url = $pypi_index_url" >> ~/.pip/pip.conf && \
    echo "trusted-host = $(echo $pypi_url | perl -pe 's|^.*?://(.*?)(:.*?)?/.*$|$1|')" >> ~/.pip/pip.conf

# RUN apt-get install -y \
#     sqlite3

# Setup a working directory to allow for
# docker run --rm -ti -v ${PWD}:/work ...
# =======================================
RUN mkdir /work
WORKDIR /work
#EOP

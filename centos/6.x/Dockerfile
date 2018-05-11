FROM       daocloud.io/library/centos:centos6.9
MAINTAINER one

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD aliyun-epel.repo /etc/yum.repos.d/epel.repo

RUN yum install -y curl wget tar bzip2 unzip vim-enhanced passwd sudo yum-utils hostname net-tools rsync man && \
    yum install -y gcc gcc-c++ git make automake cmake patch logrotate python-devel libpng-devel libjpeg-devel && \
    yum install -y --enablerepo=epel pwgen python-pip && \
    yum clean all

# meld3
COPY meld3-1.0.2.tar.gz .
RUN tar -zxf meld3-1.0.2.tar.gz && \
    cd meld3-1.0.2 && \
    python setup.py install

COPY pip.conf ~/.pip/pip.conf
RUN pip install supervisor
ADD supervisord.conf /etc/supervisord.conf

RUN mkdir -p /etc/supervisor.conf.d && \
    mkdir -p /var/log/supervisor

EXPOSE 22

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# Time Zone
RUN echo 'ZONE="Asia/Shanghai"' > /etc/sysconfig/clock
ENV TIME_ZONE "Asia/Shanghai"
RUN rm -rf /etc/localtime && \
    ln -s /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && \
    echo $TIME_ZONE > /etc/timezone

RUN yum install -y ImageMagick && \
    yum clean all
    
# ENTRYPOINT 
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

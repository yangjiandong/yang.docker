#
# Thanks: https://github.com/Krijger/docker-cookbooks/tree/master/supervisor
#
FROM centos:6.6
MAINTAINER yangjiandong <59338947@qq.com>

# 使用 163 的源
# COPY CentOS6-Base-163.repo /etc/yum.repos.d/CentOS-Base.repo

# RUN yum update -y
RUN yum -y install wget tar gcc

ADD team-talk /opt/team-talk

RUN chmod +x /opt/team-talk/auto_setup/redis/setup.sh
RUN cd /opt/team-talk/auto_setup/redis; ./setup.sh install

RUN yum -y install libaio-devel 
RUN chmod +x /opt/team-talk/auto_setup/mariadb/setup.sh
RUN cd /opt/team-talk/auto_setup/mariadb; ./setup.sh install

# nginx
RUN chmod +x /opt/team-talk/auto_setup/nginx_php/nginx/setup.sh
RUN cd /opt/team-talk/auto_setup/nginx_php/nginx; ./setup.sh install





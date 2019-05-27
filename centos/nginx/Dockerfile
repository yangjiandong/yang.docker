FROM one/centos:7

# add nginx, logrotate
RUN yum install -y nginx\
  logrotate \
  && \
  yum clean all && rm -rf /tmp/yum*;

ADD container-files /


FROM one/centos:7

# add nginx, logrotate
RUN yum install -y nginx\
  logrotate \
  && yum clean all

# # Copy nginx configuration files
COPY ./build/logrotate.d.nginx /etc/logrotate.d/nginx
COPY ./build/crontab /etc/crontab

# supervisor
# nginx
COPY ./build/nginx.conf /etc/supervisor/conf.d/nginx.conf
# cron
COPY ./build/cron.conf /etc/supervisor/conf.d/cron.conf

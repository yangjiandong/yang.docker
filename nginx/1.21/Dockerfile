FROM nginx:1.21

RUN sed -i "s@http://\(deb\|security\).debian.org@https://mirrors.aliyun.com@g" /etc/apt/sources.list

ENV TZ Asia/Shanghai

RUN apt-get update &&\
  apt-get install -y cron curl logrotate &&\
  apt-get clean

# logrotate config nginx
ADD conf/logrotate /etc/logrotate.d/nginx

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

EXPOSE 80 443

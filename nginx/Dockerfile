FROM nginx:1.14

ENV TZ Asia/Shanghai

COPY sources.163.txt /etc/apt/sources.list

##install cron and curl — so we can register dns regularly
RUN apt-get update &&\
  apt-get install -y cron curl logrotate &&\
  apt-get clean

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

WORKDIR workspace

# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:5.5.2

USER root
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#COPY locale.conf /etc/locale.conf
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
# locale -a 问题，不显示 zh_CN
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 

#USER logstash

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

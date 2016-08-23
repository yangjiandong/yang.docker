FROM yangjiandong/base:v1

# Use Chinese sources.list to speed up if you are in China
# COPY sources.list /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y mysql-server-5.6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/mysql

COPY my.cnf /etc/mysql/my.cnf
COPY my-default.cnf /usr/share/mysql/my-default.cnf

COPY start.sh /start.sh
RUN chmod +x /start.sh

## 解决mac mysql 权限问题
## mkdir data
## chmod 777 data
## docker run --name mysql -v ~/workspace/docker/yang.docker/mysql/data:/var/lib/mysql -d yangjiandong/mysql:latest
RUN usermod -u 1000 mysql
RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chmod -R 777 /var/lib/mysql

#VOLUME ["/var/lib/mysql"]

EXPOSE 3306

CMD ["/start.sh"]

FROM one/centos:7

# ADD aliyun-mirror.repo /etc/yum.repos.d/CentOS-Base.repo
ADD wandisco-svn.repo /etc/yum.repos.d/wandisco-svn.repo

# apache
RUN yum install -y httpd subversion mod_dav_svn \
    php \
    rsync \
    yum clean all

RUN mkdir /var/svn && \
    mkdir /var/svn/repo && \
    chown -R apache:apache /var/svn/repo &&\
    touch /var/svn/accessfile && \
    touch /var/svn/passwdfile && \
    chmod 777 /var/svn/accessfile && \
    chmod 777 /var/svn/passwdfile

RUN mkdir -p /var/www/html/svnadmin/data && \
    chmod -R 777 /var/www/html/svnadmin/data/ && \
    chown -R apache:apache /var/www/html/svnadmin/

EXPOSE 80

# Can't open file '/root/.subversion/servers': Permission denied)
RUN chmod 551 /root

# ENTRYPOINT apachectl -k start && /bin/bash
# ENTRYPOINT /usr/sbin/httpd -D FOREGROUND
ADD container-files /


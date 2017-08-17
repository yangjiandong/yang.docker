
FROM one/centos:6.9

# apache
RUN yum install -y httpd subversion mod_dav_svn && \
    yum install -y php  && \
    yum clean all

RUN mkdir /var/svn && \
    mkdir /var/svn/repo && \
    touch /var/svn/accessfile && \
    touch /var/svn/passwdfile && \
    chmod 777 /var/svn/accessfile && \
    chmod 777 /var/svn/passwdfile

RUN mkdir -p /var/www/html/svnadmin/data && \
    chmod -R 777 /var/www/html/svnadmin/data/ && \
    chown -R apache:apache /var/www/html/svnadmin/

EXPOSE 80

ENTRYPOINT apachectl -k start && /bin/bash
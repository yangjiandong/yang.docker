
FROM one/centos:6.9

# java
COPY jdk-8u73-linux-x64.tar.gz .
RUN tar -zxvf jdk-8u73-linux-x64.tar.gz && \
    mkdir /usr/java && \
    mv jdk1.8.0_73 /usr/java && \
    rm jdk-8u73-linux-x64.tar.gz

ENV JAVA_HOME /usr/java/jdk1.8.0_73
ENV PATH $JAVA_HOME/bin:$PATH

# tomcat
ENV TOMCAT_INSTALL=apache-tomcat-8.0.30.tar.gz
COPY $TOMCAT_INSTALL .
RUN tar -zxvf $TOMCAT_INSTALL && \
    mv apache-tomcat-8.0.30 tomcat && \
    rm -rf tomcat/webapps/ROOT tomcat/webapps/docs tomcat/webapps/examples tomcat/webapps/host-manager tomcat/webapps/manager &&\
    rm $TOMCAT_INSTALL 

RUN echo "CATALINA_OPTS=-Djava.security.egd=file:/dev/./urandom" > /tomcat/bin/setenv.sh && \
    chmod a+x tomcat/bin/setenv.sh

ENV JAVA_OPTS="-server -Xms512m -Xmx1024m"

# web config
ENV SSH_CONFIG_DIR /ssh-work
RUN mkdir -p /ssh-work/config /ssh-work/upload \
    && chmod -R 777 /ssh-work

ENV CATALINA_HOME /tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
EXPOSE 8080

# run by supervisor
# CMD ["catalina.sh", "run"]

COPY tomcat.conf /etc/supervisor.conf.d/tomcat.conf
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]

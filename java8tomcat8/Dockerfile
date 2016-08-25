
FROM yangjiandong/java8centos
MAINTAINER yangjiandong

USER root

# tomcat
ENV TOMCAT_INSTALL=apache-tomcat-8.0.30.tar.gz
COPY $TOMCAT_INSTALL .
RUN tar -zxvf $TOMCAT_INSTALL && \
    mv apache-tomcat-8.0.30 tomcat && \
    rm -rf tomcat/webapps/ROOT tomcat/webapps/docs tomcat/webapps/examples tomcat/webapps/host-manager tomcat/webapps/manager &&\
    rm $TOMCAT_INSTALL 

#ENV JAVA_HOME /usr/java/jdk1.8.0_73
#ENV PATH $JAVA_HOME/bin:$PATH

#RUN cp /etc/skel/.bashrc /root \
#    && cp /etc/skel/.bash_profile /root

ENV CATALINA_HOME /tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR $CATALINA_HOME
EXPOSE 8080
CMD ["catalina.sh", "run"]


FROM one/centos:6.9

# java
COPY jdk-8u73-linux-x64.tar.gz .
RUN tar -zxvf jdk-8u73-linux-x64.tar.gz && \
    mkdir /usr/java && \
    mv jdk1.8.0_73 /usr/java && \
    rm jdk-8u73-linux-x64.tar.gz

ENV JAVA_HOME /usr/java/jdk1.8.0_73
ENV PATH $JAVA_HOME/bin:$PATH

ENV JAVA_OPTS="-server -Xms512m -Xmx1024m"

EXPOSE 8080
WORKDIR workspace

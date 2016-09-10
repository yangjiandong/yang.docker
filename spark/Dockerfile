FROM yangjiandong/hadoop:2.6.0
MAINTAINER yangjiandong

#support for Hadoop 2.6.0
#RUN curl -s http://d3kbcqa49mib13.cloudfront.net/spark-1.6.0-bin-hadoop2.6.tgz | tar -xz -C /usr/local/
# saprk
COPY spark-1.6.2-bin-hadoop2.6.tgz .
RUN tar -xzvf spark-1.6.2-bin-hadoop2.6.tgz && \
    mv spark-1.6.2-bin-hadoop2.6 /usr/local && \
    rm spark-1.6.2-bin-hadoop2.6.tgz 

RUN cd /usr/local && ln -s spark-1.6.2-bin-hadoop2.6 spark
ENV SPARK_HOME /usr/local/spark
RUN mkdir $SPARK_HOME/yarn-remote-client
ADD yarn-remote-client $SPARK_HOME/yarn-remote-client

RUN $BOOTSTRAP && $HADOOP_PREFIX/bin/hadoop dfsadmin -safemode leave && $HADOOP_PREFIX/bin/hdfs dfs -put $SPARK_HOME-1.6.2-bin-hadoop2.6/lib /spark

ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:$SPARK_HOME/bin:$HADOOP_PREFIX/bin
# update boot script
COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

RUN echo export JAVA_HOME=/usr/java/jdk1.8.0_73 >$SPARK_HOME/conf/spark-env.sh

EXPOSE 50020 50090 50070 50010 50075 8031 8032 8033 8040 8042 49707 22 8088 8030 \
    8080 7077

#CMD service sshd start

#install R
#RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
#RUN yum -y install R

#ENTRYPOINT ["/etc/bootstrap.sh"]

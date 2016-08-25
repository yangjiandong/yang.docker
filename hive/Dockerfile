FROM yangjiandong/hadoop:2.6.0 

COPY apache-hive-1.2.1-bin.tar.gz .
RUN tar -xzvf apache-hive-1.2.1-bin.tar.gz && \
    mv apache-hive-1.2.1-bin /usr/local/hive && \
    rm apache-hive-1.2.1-bin.tar.gz

COPY mysql-connector-java-5.1.39-bin.jar /usr/local/hive/lib

#COPY hive-site.xml /usr/local/hive/conf

ENV HIVE_HOME /usr/local/hive
ENV PATH $HIVE_HOME/bin:$PATH
ENV HADOOP_HOME /usr/local/hadoop

RUN mkdir /usr/local/hive/iotemp

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

#ENTRYPOINT ["/etc/bootstrap.sh"]


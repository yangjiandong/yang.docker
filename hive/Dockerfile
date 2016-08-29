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

# jline-0.9.94.jar
RUN cp $HIVE_HOME/lib/jline-2.12.jar $HADOOP_HOME/share/hadoop/yarn/lib/jline-0.9.94.jar

COPY bootstrap.sh /etc/bootstrap.sh
RUN chown root.root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

# supervisor
#RUN yum clean all -y \
#    && yum update -y \
RUN yum install -y python-setuptools 

RUN easy_install pip
RUN pip install supervisor meld3==0.6.7

CMD ["/etc/bootstrap.sh"]
# supervisor base configuration
ADD supervisor.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
# default command (创建容器时执行)
# CMD ["supervisord", "-c", "/etc/supervisor.conf"]


# ENTRYPOINT ["/etc/bootstrap.sh"]


#!/bin/bash

: ${HADOOP_PREFIX:=/usr/local/hadoop}

# for start worker
echo export JAVA_HOME=/usr/java/jdk1.8.0_73 >$SPARK_HOME/conf/spark-env.sh

cp /mconf/master-slaves.txt /usr/local/hadoop/etc/hadoop/slaves
cp /mconf/master-slaves.txt /usr/local/spark/conf/slaves
cp /mconf/master-yarn-site.xml /usr/local/hadoop/etc/hadoop/yarn-site.xml

#echo "172.17.0.150 spark-master">/etc/hosts
#echo "172.17.0.151 spark-slaver1">>/etc/hosts
#echo "172.17.0.152 spark-slaver2">>/etc/hosts

case $HOSTNAME in
    "spark-master")
        #ifconfig eth0 172.17.0.150

$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh

rm /tmp/*.pid

# installing libraries if any - (resource urls added comma separated to the ACP system variable)
cd $HADOOP_PREFIX/share/hadoop/common ; for cp in ${ACP//,/ }; do  echo == $cp; curl -LO $cp ; done; cd -

# setting spark defaults
echo spark.yarn.jar hdfs:///spark/spark-assembly-1.6.2-hadoop2.6.0.jar > $SPARK_HOME/conf/spark-defaults.conf
cp $SPARK_HOME/conf/metrics.properties.template $SPARK_HOME/conf/metrics.properties

        # altering the core-site configuration
        sed s/HOSTNAME/$HOSTNAME/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml

        service sshd start
        $HADOOP_PREFIX/sbin/start-dfs.sh
        $HADOOP_PREFIX/sbin/start-yarn.sh
        # start worker
        $SPARK_HOME/sbin/start-all.sh
    ;;
    "spark-slaver1")
        #ifconfig eth0 172.17.0.151
      # altering the core-site configuration
      sed s/HOSTNAME/spark-master/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
      service sshd start
    ;;

    "spark-slaver2")
        #ifconfig eth0 172.17.0.152
      # altering the core-site configuration
      sed s/HOSTNAME/spark-master/ /usr/local/hadoop/etc/hadoop/core-site.xml.template > /usr/local/hadoop/etc/hadoop/core-site.xml
      service sshd start
    ;;

    *)
        echo "null"
        ;;
esac

CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
	service sshd stop
	/usr/sbin/sshd -D -d
else
	/bin/bash -c "$*"
fi


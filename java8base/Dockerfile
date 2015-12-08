#
# Thanks: https://github.com/Krijger/docker-cookbooks/tree/master/supervisor
#
FROM ubuntu:14.04
MAINTAINER yangjiandong <59338947@qq.com>

ENV DEBIAN_FRONTEND noninteractive

# 使用 aliyuncs 的源
COPY sources.list.aliyuncs.txt /etc/apt/sources.list

# 保持系统最新
RUN apt-get -y update
RUN apt-get -y upgrade
RUN locale-gen zh_CN.UTF-8

# RUN apt-get install -y curl man software-properties-common unzip wget gcc fontconfig build-essential git

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
ENV HOME /root

# supervisor installation and create directory for child images to store configuration in
RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# Add oracle java 8 repository
RUN apt-get -y install wget
#software-properties-common

# get maven 3.2.2
RUN wget --no-verbose -O /tmp/apache-maven-3.2.2.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz

# verify checksum
RUN echo "87e5cc81bc4ab9b83986b3e77e6b3095 /tmp/apache-maven-3.2.2.tar.gz" | md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.2.2.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.2.2 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.2.2.tar.gz
ENV MAVEN_HOME /opt/maven

# install git
RUN apt-get install -y git

# install nano
RUN apt-get install -y nano

# remove download archive files
RUN apt-get clean

# set shell variables for java installation
ENV java_version 1.8.0_66
ENV filename jdk-8u66-linux-x64.tar.gz
ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/8u66-b17/$filename
#ENV downloadlink http://download.oracle.com/otn-pub/java/jdk/8u11-b12/$filename

# download java, accepting the license agreement
RUN wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/$filename $downloadlink 

# unpack java
RUN mkdir /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH

# configure symbolic links for the java and javac executables
RUN update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000 && update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000

## copy jenkins war file to the container
#ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
#RUN chmod 644 /opt/jenkins.war
#ENV JENKINS_HOME /jenkins

## configure the container to run jenkins, mapping container port 8080 to that host port
#ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
#EXPOSE 8080

#CMD [""]

# old, 2015.12.08
#RUN add-apt-repository ppa:webupd8team/java
#RUN apt-get -y update
## Accept the Oracle Java license
#RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 boolean true" | debconf-set-selections
## Install Oracle Java
#RUN apt-get -y install oracle-java8-installer
## Install tomcat
##RUN apt-get -y install tomcat7
##RUN echo "JAVA_HOME=/usr/lib/jvm/java-7-oracle" >> /etc/default/tomcat7
##EXPOSE 8080

#EOP

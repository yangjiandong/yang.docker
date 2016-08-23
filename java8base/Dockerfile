FROM yangjiandong/base:v1
MAINTAINER yangjiandong <59338947@qq.com>

ENV DEBIAN_FRONTEND noninteractive

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

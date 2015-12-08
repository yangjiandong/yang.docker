FROM yangjiandong/java8base
MAINTAINER yangjiandong <59338947@qq.com>

# copy jenkins war file to the container
ADD http://mirrors.jenkins-ci.org/war/1.574/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war
ENV JENKINS_HOME /jenkins

# configure the container to run jenkins, mapping container port 8080 to that host port
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
EXPOSE 8080

CMD [""]

#EOP

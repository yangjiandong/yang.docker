
FROM tianon/centos:6.5
MAINTAINER yangjiandong

USER root

# install dev tools
RUN yum install -y curl which tar sudo openssh-server openssh-clients rsync
# update libselinux. see https://github.com/sequenceiq/hadoop-docker/issues/14
RUN yum update -y libselinux

# passwordless ssh
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys


# java
COPY jdk-8u73-linux-x64.tar.gz .
RUN tar -zxvf jdk-8u73-linux-x64.tar.gz && \
    mkdir /usr/java && \
    mv jdk1.8.0_73 /usr/java && \
    rm jdk-8u73-linux-x64.tar.gz

ENV JAVA_HOME /usr/java/jdk1.8.0_73
ENV PATH $JAVA_HOME/bin:$PATH

RUN cp /etc/skel/.bashrc /root \
    && cp /etc/skel/.bash_profile /root



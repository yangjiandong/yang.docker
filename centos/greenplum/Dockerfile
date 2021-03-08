FROM one/centos:7

RUN yum -y update && yum -y install which openssh-clients passwd bash sudo \
    net-tools less iproute \
    && yum clean all

ADD ./sh/start.sh /start.sh
RUN chmod 755 /start.sh
RUN ./start.sh gpadmin changeme

RUN mkdir -p /home/gpadmin/.ssh

RUN ssh-keygen  -f /home/gpadmin/.ssh/id_rsa -N ""
RUN cp /home/gpadmin/.ssh/id_rsa.pub /home/gpadmin/.ssh/authorized_keys
RUN chmod 0400 /home/gpadmin/.ssh/authorized_keys

ADD ./sh/gpinitsystem_config_template /home/gpadmin/artifact/gpinitsystem_config_template
COPY sh/*.py sh/*.sh /home/gpadmin/artifact/
RUN chmod 755 /home/gpadmin/artifact/*.sh

COPY sh/config /home/gpadmin/.ssh/config
RUN chmod 0400 /home/gpadmin/.ssh/config

RUN mkdir -p /home/gpadmin/master /home/gpadmin/data  /home/gpadmin/mirror

RUN chown -R gpadmin /home/gpadmin
RUN chown -R gpadmin /home/gpadmin/.ssh

COPY open-source-greenplum-db-6.14.1-rhel7-x86_64.rpm /home/gpadmin/greenplum-db.rpm
RUN yum install -y /home/gpadmin/greenplum-db.rpm
RUN chown -R gpadmin /usr/local/greenplum-db*
RUN rm -f /home/gpadmin/greenplum-db.rpm

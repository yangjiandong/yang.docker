FROM centos:7.6.1810

COPY locale.conf /etc/locale.conf
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
# locale -a 问题，不显示 zh_CN
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#ssh
RUN yum install -y \
  openssh openssh-server openssh-clients \
  cronie
RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN sed -i 's/#UseDNS yes/UseDNS no/g' /etc/ssh/sshd_config
RUN sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/sshd_config
RUN /bin/echo 'root:123456' |chpasswd
RUN /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd

#supervisor
RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y supervisor
RUN yum clean all
RUN mkdir -p /etc/supervisor/conf.d/
COPY supervisord.conf /etc/supervisor/

# sshd
COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
EXPOSE 22

# 注意，只能有一个 cmd，并且 docker run 指定cmd 时也会覆盖原有cmd
# /tmp/supervisord.log
CMD /usr/bin/supervisord -c /etc/supervisor/supervisord.conf

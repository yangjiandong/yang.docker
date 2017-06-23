FROM hub.c.163.com/public/centos:7.2.1511

RUN yum clean all
RUN yum install -y yum-plugin-ovl || true
RUN yum install -y vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cronie python-setuptools
RUN yum clean all
RUN easy_install supervisor
RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
EXPOSE 22

RUN mkdir -p /etc/supervisor/conf.d/
RUN /usr/bin/echo_supervisord_conf > /etc/supervisord.conf
RUN echo [include] >> /etc/supervisord.conf
RUN echo 'files = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf

COPY locale.conf /etc/locale.conf
COPY sshd.conf /etc/supervisor/conf.d/sshd.conf

#ENV LANG="zh_CN.UTF-8"
#ENV LC_ALL="zh_CN.UTF-8"

ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8

# locale -a 问题，不显示 zh_CN
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8 

CMD ["/usr/bin/supervisord"]

FROM million12/centos-supervisor:4.0.2

RUN \
  yum install -y \
  openssh openssh-server openssh-clients \
  cronie && \
  yum clean all && rm -rf /tmp/yum*;

RUN mkdir /var/run/sshd
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key \
  && ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key \
  && ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key \
  && ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN sed -i 's/#UseDNS yes/UseDNS no/g' /etc/ssh/sshd_config
RUN sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/sshd_config
RUN /bin/echo 'root:123456' |chpasswd
RUN /bin/sed -i 's/.*session.*required.*pam_loginuid.so.*/session optional pam_loginuid.so/g' /etc/pam.d/sshd

# sshd
ADD container-files /
EXPOSE 22

COPY locale.conf /etc/locale.conf
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN.UTF-8
RUN localedef -c -f UTF-8 -i zh_CN zh_CN.utf8
# RUN cp -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone


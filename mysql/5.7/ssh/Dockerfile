FROM one/mysql:5.7
#更新apt-get源 使用sohu的源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
        echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >/etc/apt/sources.list && \
        echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list && \
        echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list && \
        echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list

#安装SSH服务
RUN apt-get update && apt-get install -y openssh-server net-tools &&\
    mkdir -p /var/run/sshd &&\
    mkdir -p /root/.ssh

#取消pam登录限制
RUN sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/g' /etc/pam.d/sshd

#添加认证文件和启动脚本
ADD authorized_keys /root/.ssh/authorized_keys
RUN echo "#!/bin/bash" > /root/run.sh &&\
    echo "/usr/sbin/sshd -D" >> /root/run.sh &&\
    chmod u+x /root/run.sh

#导出端口
EXPOSE 22

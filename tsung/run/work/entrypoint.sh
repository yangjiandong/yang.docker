#!/bin/bash
# ./filedownload.sh

# 环境变量
#env
TSUNG_SSH_PORT="${TSUNG_SSH_PORT:-1022}" && \
SSH_CONF_FILE="${SSH_CONF_FILE:-/root/.ssh/config}" && \
AUTH_FILE="${AUTH_FILE:-/root/.ssh/authorized_keys}" && \
RSA_FILE="${RSA_FILE:-/root/.ssh/id_rsa}" && \
HOSTNAME_FILE="${HOSTNAME_FILE:-/etc/hosts}" && \
TSUNG_ROLE="${TSUNG_ROLE:-MASTER}" && \
#TSUNG_SLAVE_MARATHON_ID
#TSUNG_MASTER_IP

# 客户端如果是nat模式发，多端口使用，现在暂时不用
# Failure parameter
for_in_file() {

    for i in  `cat $HOSTNAME_FILE | awk '{print $1","$2}'`
      do
            IP=$(echo $i | awk -F ',' '{print $1}')
            HOSTNAME=$(echo $i | awk -F ',' '{print $2}')
            echo "Host $HOSTNAME" >> $SSH_CONF_FILE
            echo "    Hostname $IP" >> $SSH_CONF_FILE
            echo "    #IdddentityFile" >> $SSH_CONF_FILE
            echo "    #User root" >> $SSH_CONF_FILE
            echo "    Port $TSUNG_SSH_PORT" >> $SSH_CONF_FILE
            echo "    StrictHostKeyChecking no" >> $SSH_CONF_FILE
            echo "    UserKnownHostsFile /dev/null" >> $SSH_CONF_FILE
      done
}
# 主机名文件自动添加，给tsung进行主机名登录用
# hosts
creat_hosts() {
    if [ "$TSUNG_ROLE" == "SLAVE" ];then
            MARATHON_APP_ID="$(echo $MARATHON_APP_ID | awk -F '/' '{print $2}')"
            TSUNG_MASTER_HOSTNAME="${TSUNG_MASTER_HOSTNAME}"
            TSUNG_MASTER_IP="${TSUNG_MASTER_IP}"
            if [ -n "${TSUNG_MASTER_IP}" ];then
                    if [ -n "${TSUNG_MASTER_HOSTNAME}" ];then
                            echo "${TSUNG_MASTER_IP} ${TSUNG_MASTER_HOSTNAME}" >> $HOSTNAME_FILE

                    else
                            echo "TSUNG_MASTER_HOSTNAME is null!!"
                            exit 1
                    fi
    else
            echo "TSUNG_MASTER_IP is null!!"
            exit 1
    fi
    fi

    if [ "$TSUNG_ROLE" == "MASTER" ];then
            MARATHON_APP_ID="${TSUNG_SLAVE_MARATHON_ID}"
    fi
    if [ -n "${MARATHON_APP_ID}" ];then


            if [ -n "${MARATHON_URL}" ];then
                    echo "Discovering tsung-slaves ..."
                    curl -s ${MARATHON_URL}/v2/apps/${MARATHON_APP_ID} |awk -F 'lastTaskFailure' '{print $1}'| grep -Po '"host":"\K.*?(?=")' |sort -n | awk '{ print $1" TsungSalve"NR}' >> $HOSTNAME_FILE
            else
                    echo "MARATHON_URL is null!!"
                    exit 1

            fi
    fi


}
# ssh服务 设置
# ssh clent setting
easy_ssh_config(){
    # setting ssh
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' && \
    # ssh port
    echo "    Port $TSUNG_SSH_PORT" >> $SSH_CONF_FILE && \
    # no login yes
    echo "    StrictHostKeyChecking no" >> $SSH_CONF_FILE && \
    echo "    UserKnownHostsFile /dev/null" >> $SSH_CONF_FILE && \
    # check ssh key file
    if [ -f "$AUTH_FILE" ]&&[ -f "$RSA_FILE" ] ;then
            chmod 600 $RSA_FILE && \
            chmod 600 $AUTH_FILE
    else
            echo "ssh file is donot exist" && \
            exit 1
    fi
}

# 启动 slave 方法调用
tsung_slave(){
    echo "----------- TSUNG_ROLE IS SLAVE -----------"
    #ssh server setting
            easy_ssh_config && \
            creat_hosts && \
            /usr/sbin/sshd -e -p $TSUNG_SSH_PORT -D
}
# 启动 master 方法调用
tsung_master(){
    echo "----------- TSUNG_ROLE IS MASTER -----------"
            easy_ssh_config && \
            creat_hosts && \
            /usr/sbin/sshd -p $TSUNG_SSH_PORT
            # /usr/local/tsung/bin/tsung -f /data/tsung.xml -k start
}
if [ "$TSUNG_ROLE" == "SLAVE" ];then
    tsung_slave
fi

if [ "$TSUNG_ROLE" == "MASTER" ];then
    tsung_master
fi

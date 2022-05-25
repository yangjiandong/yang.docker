#!/bin/bash
#此脚本用于自动分割Nginx的日志，包括access.log和error.log
#每天00:00执行此脚本 将前一天的access.log重命名为access-xxxx-xx-xx.log格式，并重新打开日志文件
#Nginx日志文件所在目录
#
# # 打开linux计划任务
# crontab -e
# # 输入以下代码
# 00 00 * * * /bin/bash /data/web/vhost/log/cutLog.sh

LOG_PATH="/var/log/nginx"

#获取昨天的日期
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d)

#获取pid文件路径
PID=/var/run/nginx.pid

#分割日志
mv ${LOG_PATH}/access.log ${LOG_PATH}/access-${YESTERDAY}.log
mv ${LOG_PATH}/error.log ${LOG_PATH}/error-${YESTERDAY}.log

#向Nginx主进程发送USR1信号，重新打开日志文件
kill -USR1 `cat ${PID}`
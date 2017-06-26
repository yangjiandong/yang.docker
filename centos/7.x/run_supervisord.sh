#! /bin/bash
#  centos7 后台运行有问题，不能正常运行
docker run -d -p 2222:22 --name centos7.supervisor one/centos:7.2

centos 7.6
---

- show version: `cat /etc/redhat-release`
- show kernal: `uname -a`

### base on million12/centos-supervisor:4.0.2

- one/centos:7
- centos-supervisor:4.0.2 相关配置

  ```
  ADD container-files /
  VOLUME ["/data"]
  ENTRYPOINT ["/config/bootstrap.sh"]
  EXPOSE 9111
  ```

- 启动命令
  - container-base.files/config/bootstrap.sh
- supervisorctl, [inet_http_server]
  - port = :9111
  - username = sv
  - password = password
- 增加项目
  - ssh, user: root,123456
  - croni

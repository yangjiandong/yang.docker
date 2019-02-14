openresty 1.13.6
===

说明
---

- base `https://github.com/openresty/docker-openresty/blob/master/centos/Dockerfile`, use one/centos:7.6
- `conf`, nginx 默认配置及参考
    - `conf/nginx.conf` 为主要配置
- `conf.d`, 具体项目配置
- `workspace`, 工作目录，一般存放项目
    - `reload.sh`, 重启 nginx
- `logs`, 日志，参考 nginx 按日期分割,
  - docker add: `RUN yum -y install logrotate && yum clean all`
  - add `/etc/logrotate.d/openresty`

    ```
    /var/log/nginx/*.log {
            daily
            missingok
            rotate 52
            compress
            delaycompress
            notifempty
            create 640 nginx adm
            sharedscripts
            postrotate
                    if [ -f /var/run/nginx.pid ]; then
                            kill -USR1 `cat /var/run/nginx.pid`
                    fi
            endscript
    }
    ```

    测试 `logrotate -vf /etc/logrotate.d/openresty`

  - cron 自动分割日志, use supervisor

- `default-config`, 镜像默认配置，参考用

> 注意 log、pid 路径不要再改动，日志分割脚本已固化

项目
---

- [微服务](https://github.com/horan-geeker/nana)
- [openresty-test](http://58.216.212.154:10080/yangjiandong/openresty-test)

## 2019.02.14

- [看下 lua-nginx](https://github.com/openresty/lua-nginx-module)

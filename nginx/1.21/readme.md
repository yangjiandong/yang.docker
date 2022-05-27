## nginx 1.21

- [base on debian bullseye](https://github.com/nginxinc/docker-nginx/blob/d039609e3a537df4e15a454fdb5a004d519e9a11/mainline/debian/Dockerfile)
  - cron 不能在 docker 下启动，采用 supervisor
- 暂时不做设置，好像系统已经放大了

```
--sysctl net.ipv4.ip_local_port_range="1024 65535" \
--ulimit nofile=65536:65536 \
```

- nginx 日志每天切割，use logrotate
  - 测试 `logrotate -vf /etc/logrotate.d/openresty`
  - cron 自动分割日志
  - cron 结果查看 `logs/readme.md`
- nginx 配置
  - /etc/nginx/nginx.conf
  - /etc/nginx/conf.d
  - 其他暂时采用系统默认

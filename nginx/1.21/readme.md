## nginx 1.21

- base on debian bullseye
- 暂时不做设置，好像系统已经放大了

```
--sysctl net.ipv4.ip_local_port_range="1024 65535" \
--ulimit nofile=65536:65536 \
```

- nginx 日志每天切割，use logrotate
- nginx 配置
  - /etc/nginx/nginx.conf
  - /etc/nginx/conf.d
  - 其他暂时采用系统默认

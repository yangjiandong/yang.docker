docker nextcloud
---

## install

- user: admin,123
- use mysql:
  - user: nextcloud, 123
  - database: nextcloud
  - host: mysql

## start

```
sh start.sh
```

## use

browser `http://192.168.1.41:8200`

## setup

- admin 登录，设置，管理，分享
  - 关闭“允许二次分享”
  - 关闭“联合云共享”
- 共享时密码保护


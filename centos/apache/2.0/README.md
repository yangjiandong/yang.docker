## Apache + Svn + SvnAdmin

- Apache 2.4.6, use `httpd -v`
- Svn 1.8.19, use `svn --version`
- SvnAdmin 1.6.2

### install

- build docker
- `chmod -R 777 ssh-work/www/html/svnadmin/data`
- `chmod 777 ssh-work/svn/accessfile`
- `chmod 777 ssh-work/svn/passwdfile`
  注意，可以先清空 passwdfile，重新生成 admin 用户
- run，如果是空的，会提示配置，参考 pdf
- access brower `http://192.168.1.205/svn/demo`

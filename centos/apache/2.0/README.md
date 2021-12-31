## Apache + Svn + SvnAdmin

- base on one/centos:7
- Apache 2.4.6, use `httpd -v`
- Svn 1.8.19, use `svn --version`
- SvnAdmin 1.6.2

### install

- build docker
- `chmod -R 777 ssh-work/www/html/svnadmin/data`
- `chmod 777 ssh-work/svn/accessfile`
- `chmod 777 ssh-work/svn/passwdfile`
  注意，可以先清空 passwdfile，重新生成 admin 用户
  合并以前的用户, `cat svn_passwd >> passwdfile`, `cat svn_access >> accessfile`, 还要再次执行下 `chmod 777`
- run，如果是空的，会提示配置，参考 pdf
- access brower `http://192.168.1.205/svn/demo`
- 使用老仓库，需更改下用户所属，先看下使用 docker 生成仓库的文件夹用户所属，`48:48`

  ```
  cd ssh-work/svn/repo
  chown -R 48:48 his
  ```

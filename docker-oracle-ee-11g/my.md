ora11g
===

### oracle 11g

- [docker-oracle-ee-11g](https://github.com/MaksymBilenko/docker-oracle-ee-11g)
- run
  
  ```
  docker run \
  -d \
  --name ora11g \
  --privileged=true \
  -p 1158:8080 -p 1521:1521 \
  -v $(pwd)/oracle/data:/u01/app/oracle \
  -h ora11g one/ora11g
```

in win10, 共享目录路径问题还没解决，展示只能设置为 `oradata`, 具体路径还不知在哪

  ```
  rem 本地计算机策略 - 计算机配置 - windows 设置 - 安全设置 - 本地策略 - 安全选项 - 网络访问: 本地帐户的共享和安全模型 - 经典
  docker run -d ^
  --name ora11g ^
  -v oradata:/u01/app/oracle ^
  -e CHARACTER_SET=ZHS16GBK ^
  -p 8001:1158 -p 1522:1521 ^
  -h ora11g-gbk one/ora11g
  ```

- oracle

  ```
  hostname: 192.168.1.41
  port: 1521
  sid: EE
  service name: EE.oracle.docker
  username: system(sys)
  password: oracle
  ```

- use

  ```
  create tablespace tsp_hcost
  datafile '/u01/app/oracle/oradata/EE/aphcost.dbf'
  size 100M
  reuse
  autoextend on
  next 50M;

  CREATE USER "HCOST"
    PROFILE "DEFAULT" IDENTIFIED BY "123"
    DEFAULT TABLESPACE "TSP_HCOST" TEMPORARY TABLESPACE "TEMP"
    ACCOUNT UNLOCK;

   GRANT "DBA" TO "HCOST";
   GRANT "CONNECT" TO "HCOST";
   GRANT "RESOURCE" TO "HCOST";
   ```
- em 过段时间失效，下次进了就没启动

  找不到 `/u01/app/oracle/product/11.2.0/EE/oc4j/j2ee/OC4J_DBConsole_b0482d3bf9ab_EE`

  - use one/ora11g run
  - 重新生成镜像 `docker commit ora11g one/ora11g.2`
  - run from one/org11g.2
  - docker exec -it orac11g /bin/bash
    - su oracle
    - emctl start dbconsole

  - 但过段时间还是会失效
    - emctl status dbconsole
      
      ...
      EM Daemon is not running.
    - 重新配置: emca -config dbcontrol db -repos recreate, 没解决

  - q
    - user root run: lsnrctl start
    - /network/admin/listener.ora
      (DESCRIPTION=(ADDRESS=(PROTOCOL=tcp)(HOST=ora11g)(PORT=1521)))
    - /u01/app/oracle/product/11.2.0/EE/ora11g_EE/sysman/logs, tail -f emagent.trc
    
- start em
  - 11g,use: emctl start(stop,status) dbconsole
  - 12,use: exec dbms_xdb_config.sethttpport(1158)
- 内存 ?

- [oracle Official](https://github.com/oracle/docker-images/tree/master/OracleDatabase)
- TZ='Asia/Shanghai' date
- 字符集
  ```
  select * from nls_database_parameters;
  ```
  
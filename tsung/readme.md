tsung
---

## 安装

创建秘钥对

  ssh-keygen -N "" -f /data/config/tsung/id_rsa
设置公钥

  mv  /data/config/tsung/id_rsa.pub /data/config/tsung/authorized_keys

参考 `OpenDockerFile-master.zip`
- tsung.xml 说明
- example, 测试示例

## run

```
cd run
sh run-demo.sh
#in container
sh ./entrypoint.sh
sh ./tsung-start.sh
```

## create reports

```
cd logs/xxx
/usr/local/tsung/lib/tsung/bin/tsung_stats.pl
```

open browser: graph.html, report.html

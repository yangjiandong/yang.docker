# openresty 1.15.8

## use GraphicsMagick

- 安装完 graphicMagick 查看支持格式
  ```
  gm convert -list formats
  ```
- run GraphicsMagick
  - 只缩小不放大, `gm convert input.jpg -resize "500x500>" output_1.jpg`
  - 等比缩图 （缺点：产生白边）, `gm convert input.jpg -thumbnail "100x100" output_1.jpg`
  - 非等比缩图，按给定的参数缩图（缺点：长宽比会变化）, `gm convert input.jpg -thumbnail "100x100!" output_2.jpg`
  - 裁剪后保证等比缩图 （缺点：裁剪了图片的一部分）, `gm convert input.jpg -thumbnail "100x100^" -gravity center -extent 100x100 output_3.jpg`
- example
- [openresty图片压缩之 lua调用GraphicsMagick](https://my.oschina.net/u/2553994/blog/669116)
- [nginx-lua-GraphicsMagick](https://github.com/yanue/nginx-lua-GraphicsMagick)
- [OpenResty(Nginx)+Lua+GraphicsMagick实现缩略图功能](https://www.cnblogs.com/archoncap/p/4560613.html)
- [nlgm](https://github.com/wudi/nlgm)


## docker base centos:7

1.13.6 base centos:7.6

## use

### supervisorctl

in container
- supervisorctl, restart nginx

报错查找，`supervisorctl tail nginx stderr`

### 增加图片输出多尺寸功能

- run.sh, `-v $(pwd)/static://usr/share/nginx/html/front/static`
- use
  - `http://localhost:8888/front/static/demo/ad1.jpg`
  - `http://localhost:8888/front/static/demo/ad1.jpg!300x200`

- 找不到 `image_filter` module

以上方式不适用 openresty

### use magick

[参考](https://blog.didiyun.com/index.php/2018/11/19/imagemagickopenresty/)

```
yum -y install ImageMagick ImageMagick-devel
```

- 下载 Lua 的 Magick 库

  选用开源的 leafo/magick, github 地址：https://github.com/leafo/magick.git 。

  cd /root/zhangjie/tools
  git clone https://github.com/leafo/magick.git

- 确认库功能正常

  cd /root/zhangjie/tools/magick
  cp /opt/app/openresty/nginx/test/didiyun.png .

- 编写测试用的 Lua 程序 image_convert_test.lua：

  [root@10-255-0-25 magick]# cat image_convert_test.lua

  local magick = require("magick")
  magick.thumb("didiyun.png", "100x100", "didiyun_dest.png")

- 执行命令：

  /opt/app/openresty/luajit/bin/luajit image_convert_test.lua


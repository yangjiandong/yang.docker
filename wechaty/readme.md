# wechaty

Wechaty, 微信

- pull docker image

  ```bash
  docker pull zixia/wechaty
  # or
  docker pull hub-mirror.c.163.com/zixia/wechaty
  ```

- examples

  ```
  run.sh mybot.js
  # or shell
  run.sh shell
  ```

  具体启动项参考 `entrypoint.sh`
  
- wechaty-getting-started, docker 示例比较老

### q

- I can not login with my Wechat account
  Wechat account that registered after 2017 will not be able to login via Web API. Learn more at https://github.com/Chatie/wechaty/issues/872

  Solution: Wechaty support protocols other than Web API, such as pad. Learn more at https://github.com/Chatie/wechaty/issues/1296

  暂时还没找到等了web 版微信的办法

  ? wechaty-puppet

local common = require "comm.common"

function say_hello()
  ngx.say('hello, 中午')
  common.hello()
end

say_hello()

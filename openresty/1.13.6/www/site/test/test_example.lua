local common = require "comm.common"

function say_hello()
  -- ngx.say(os.date("%x", os.time()))
  ngx.say(os.date("%Y-%m-%d %H:%M:%S", os.time()))
  common.hello()
end

say_hello()

local common = require "comm.common"

function say_hello()
  ngx.log(ngx.ERR, "hello x")
  -- ngx.say(os.date("%x", os.time()))
  ngx.say(os.date("%Y-%m-%d %H:%M:%S", os.time()))
  common.hello()
  -- use imageMagick, now use graphicMagick
  -- local magick = require "magick"
  -- magick.thumb("ad1.jpg", "100x100", "ad1_dest.jpg")
end

say_hello()

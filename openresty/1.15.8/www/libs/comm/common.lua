local count = 0
local u = [[
  多行字符
]]

-- 支持闭包及匿名函数：
function adder(x)
  -- 调用adder时，会创建返回的函数，
  -- 并且会记住x的值：
  return function (y) return x + y end
end
-- a1 = adder(9)
-- a2 = adder(36)
-- print(a1(16))  --> 25
-- print(a2(64))  --> 100

local function hello()
    count = count + 1
    ngx.say("计数 :", count)
end

local function strConcat(...)
    local temp = {...}
    local ans = table.concat(temp, " ")
    return ans
end

local function swap(a,b)
    return b,a
end

-- 重载 __add
local union = function(self, another)
    local set = {}
    local result = {}

    -- 利用数组来确保集合的互异性
    for k, v in pairs(self) do set[v]=true end
    for k, v in pairs(another) do set[v]= true end

    -- add sets
    for k, v in pairs(set) do table.insert(result, k) end
    return result
end

-- 删除空格
local function ltrim(s)
    if not s then
        return s
    end
    local res = s
    local tmp = string.find(res, '%S')
    if not tmp then
        res = ''
    elseif tmp ~= 1 then
        res = string.sub(res, tmp)
    end
    return res
end

local function rtrim(s)
    if not s then
        return s
    end
    local res = s
    local tmp = string.find(res, '%S%s*$')
    if not tmp then
        res = ''
    elseif tmp ~= #res then
        res = string.sub(res, 1, tmp)
    end

    return res
end

local function trim(s)
    if not s then
        return s
    end
    local res1 = ltrim(s)
    local res2 = rtrim(res1)
    return res2
end

function split(szFullString, szSeparator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
       local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
       if not nFindLastIndex then
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
        break
       end
       nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
       nFindStartIndex = nFindLastIndex + string.len(szSeparator)
       nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end

--字符串转换为unicode编码
local bit = require("bit")
local bit_band = bit.band
local bit_bor = bit.bor
local bit_lshift = bit.lshift
local string_format = string.format
local string_byte = string.byte
local table_concat = table.concat

local function utf8_to_unicode(str)
    if not str or str == "" or str == ngx.null then
        return nil
    end
    local res, seq, val = {}, 0, nil
    for i = 1, #str do
        local c = string_byte(str, i)
        if seq == 0 then
            if val then
                res[#res + 1] = string_format("%04x", val)
            end

           seq = c < 0x80 and 1 or c < 0xE0 and 2 or c < 0xF0 and 3 or
                              c < 0xF8 and 4 or --c < 0xFC and 5 or c < 0xFE and 6 or
                              0
            if seq == 0 then
                ngx.log(ngx.ERR, 'invalid UTF-8 character sequence' .. ",,," .. tostring(str))
                return str
            end

            val = bit_band(c, 2 ^ (8 - seq) - 1)
        else
            val = bit_bor(bit_lshift(val, 6), bit_band(c, 0x3F))
        end
        seq = seq - 1
    end
    if val then
        res[#res + 1] = string_format("%04x", val)
    end
    if #res == 0 then
        return str
    end
    return "\\u" .. table_concat(res, "\\u")
end

-- ngx.say("utf8 to unicode : ", utf8_to_unicode("abc中文"), "<br/>")

local _M = {
    hello = hello,
    strConcat = strConcat,
    swap = swap,
    union = union,
    utf8_to_unicode = utf8_to_unicode,
    ltrim = ltrim,
    rtrim = rtrim,
    trim = trim,
    split = split
}

return _M

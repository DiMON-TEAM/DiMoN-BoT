--by @alireza_PT
--Our channel: @create_antispam_bot

do

local function set_pass(msg, pass, id)
  local hash = nil
  if msg.to.type == "channel" then
    hash = 'setpass:'
  end
  local name = string.gsub(msg.to.print_name, '_', '')
  if hash then
    redis:hset(hash, pass, id)
      return send_large_msg("channel#id"..msg.to.id, "🔐رمز ورود برای سوپرگروه : ["..name.."] تنظیم شد به:\n> "..pass.."\n\nاکنون کاربران میتوانند با مراجعه به خصوصی ربات و طبق این طریق اقدام به عضویت در گروه کنند\n\n#join "..pass.." ", ok_cb, true)
  end
end

local function is_used(pass)
  local hash = 'setpass:'
  local used = redis:hget(hash, pass)
  return used or false
end
local function show_add(cb_extra, success, result)
  vardump(result)
    local receiver = cb_extra.receiver
    local text = "بسیار خوب:) \n من شما را به گروه> "..result.title.." اضافه میکنم"
    send_large_msg(receiver, text)
end
local function added(msg, target)
  local receiver = get_receiver(msg)
  channel_info("channel#id"..target, show_add, {receiver=receiver})
end
local function run(msg, matches)
  if matches[1] == "setpass" and msg.to.type == "channel" and matches[2] then
    local pass = matches[2]
    local id = msg.to.id
    if is_used(pass) then
      return "متاسفم!این رمز ورود از قبل گرفته شده است\nلطفا گذرواژه ای دیگر انتخاب نمایید"
    end
    redis:del("setpass:", id)
    return set_pass(msg, pass, id)
  end
  if matches[1] == "join" and matches[2] then
    local hash = 'setpass:'
    local pass = matches[2]
    local id = redis:hget(hash, pass)
    local receiver = get_receiver(msg)
    if not id then
      return " متاسفم!گروهی با این رمز عبور وجود ندارد!\n> شاید رمز ورود به گروه عوض شده است!"
    end
    channel_invite("channel#id"..id, "user#id"..msg.from.id, ok_cb, false) 
  return added(msg, id)
  else
  return "من  نمیتوانم شما را به گروه"..string.gsub(msg.to.id.print_name, '_', ' ').." اضافه کنم"
  end
  if matches[1] == "pass" then
   local hash = 'setpass:'
   local chat_id = msg.to.id
   local pass = redis:hget(hash, channel_id)
   local receiver = get_receiver(msg)
   send_large_msg(receiver, "رمز ورود برای سوپرگروه : ["..msg.to.print_name.."]\n\nرمز عبور > "..pass)
 end
end

return {
  patterns = {
    "^[/#](setpass) (.*)$",
    "^[/#](pass)$",
    "^[/#]([Jj]oin) (.*)$",
	"^!!tgservice (chat_add_user)$",
	"^!!tgservice (.+)$",
    "^!!tgservice (chat_del_user)$"

  },
  run = run
}

end
--by @alireza_PT
--Our channel: @create_antispam_bot
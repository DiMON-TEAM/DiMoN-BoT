local function get_message_callback(extra, success, result)
  if result.to.type == 'channel' then
    if our_id == result.from.peer_id then
      send_msg(extra, "you can\'t kick me :p", ok_cb, false)
    else
      local del=
channel_kick("channel#id",  result.to.peer_id, "user#id",  result.from.peer_id, ok_cb, false)
      if del == false then
        send_msg(extra, "Kicking failed.", ok_cb, false)
        return
      end
    end
  else
    send_msg(extra, "You're not in a SuperGroup", ok_cb, false)
    return
  end
end
local function run(msg, matches)
  if msg.text == "!kick" and is_momod(msg) and msg.reply_id then
    msgr = get_message(msg.reply_id,get_message_callback, get_receiver(msg))
  end
end
return {
   description = "kick by reply.",
   usage = {
   },
   patterns = {
      "^!kick$"
   },
   run = run
   
}

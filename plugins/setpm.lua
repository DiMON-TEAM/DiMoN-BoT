function run (msg,matches)
  if matches[1] == "set" and matches[2] == "sudo" and is_sudo(msg) then
    local waiting = redis:set('sudo:','waiting:'..msg.from.id)
    return 'متن جدید را ارسال کنید✔'
    else
    local output = redis:get('sudo:')
    if output == 'waiting:'..msg.from.id then
   if redis:set('sudo:','waiting:'..msg.from.id) and is_sudo(msg) then
      local setted = redis:set('sudo:',msg.text)
        return '✅متن جدید ثبت شد'
      end 
end 

if  matches[1] == "sudo" and is_momod(msg) then
      local output = redis:get('sudo:')
    return output
    end
end
end 
return {               
patterns = {
   "^[!/]([Ss]et) (sudo)$",
   "^[!/#](sudo)$",
   "^(.*)$",
   },
run = run,
}

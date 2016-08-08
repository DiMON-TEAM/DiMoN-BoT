do

function run(msg, matches)
  return [[ ⭕️دستورات فارسی ربات:
___________________
!info
🔰اطلاعات خود🔰
!admins
🔰لیست ادمین های سوپر گروه🔰
!setadmin
🔰تنظیم ادمین سوپر گروه🔰
!owner
🔰مالک سوپر گروه🔰
!setowner
🔰تنظیم مالک سوپر گروه🔰
!modlist
🔰لیست مدیران🔰
!bots
🔰لیست ربات ها در سوپر گروه🔰
!block
🔰اخراج شخص از سوپر گروه🔰
(ورود شخص به لیست مسدودان)
!ban [id|username|reply]
🔰مسدود کردن شخص از سوپر گروه🔰
!unban [id|username|reply]
🔰حذف مسدودی شخص از سوپر گروه🔰
!id
🔰ایدی سوپر گروه (و ایدی شخص با ریپلی)🔰
!id from
🔰ایدی شخص فوروارد کننده پیام🔰
!kickme
🔰خروج از سوپر گروه🔰
!promote [username|id]
🔰ارتقاع کاربر به مدیر سوپر گروه🔰
!demote [username|id]
🔰حذف مدیر سوپر گروه🔰
!setname [name]
🔰تنظیم نام گروه🔰
!setphoto 
🔰تنظیم عکس گروه🔰
!setrules [rules]
🔰تنظیم قوانین گروه🔰
!setabout [about]
🔰تنظیم موضوع گروه🔰
!save [value] <text>
🔰یادداشت متن های گروه🔰
!get [value]
🔰مشاهده یک متن گروه🔰
!newlink
🔰ساخت لینک جدید🔰
!link
🔰لینک فعلی گروه🔰
!linkpv
🔰فرستادن لینک سوپر گروه در پیوی🔰
!rules
🔰قوانین گر‌وه🔰
!lock [links|flood|spam|arabic|member|rtl|sticker|contacts|strict|tgservice|forward]
🔰قفل موارد بالا🔰
!unlock [links|flood|spam|arabic|member|rtl|sticker|contacts|strict|tgservice|forward]
🔰باز کردن موارد بالا🔰
!mute [all|audio|gifs|photo|video|text|service]
🔰موت موارد بالا🔰
!unmute [all|audio|gifs|photo|video|text|service]
🔰لغو موت موارد بالا🔰
!setflood [value]
🔰تنظیم اندازه حساسیت اسپم🔰
!settings
🔰تنظیمات سوپر گروه🔰
!muteslist
🔰لیست موت های سوپر گروه🔰
!muteuser [username|id]
🔰موت و باز کردن موت شخصی🔰
!mutelist
🔰لیست کاربران موت شده🔰
!banlist 
🔰لیست مسدودان🔰
!clean [rules|about|modlist|mutelist]
🔰پاک کردن موارد بالا🔰
!del 
🔰پاک کردن یک پیام با ریپلی🔰
!public [yes|no]
🔰خصوصی و عمومی کردن سوپر گروه🔰
!res [username]
🔰ایدی شخص با یوزرنیم🔰
!log
🔰لوگ سوپر گروه🔰
!addword [text]
🔰فیلتر کردن متن🔰
!badwords
🔰لیست متن های فیلتر شده🔰
!rw [text]
🔰حذف متن از لیست فیلتر ها🔰
!clearbadwords
🔰حذف تمامی فیلتر ها🔰
___________________
*شما میتوانید از علامت های (!)(/)(#)*
Channel: @ShaTelTeam]]

end

return {
  description = " bot help", 
  usage = "help",
  patterns = {
    "^[!/#]helpfa$"
  }, 
  run = run 
}

end
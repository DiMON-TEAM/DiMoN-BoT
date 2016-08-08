do

function run(msg, matches)
  return 'نرخ گروه ها '.. [[
msg.from.print_name.."\n➖➖➖➖➖➖➖➖➖➖➖\n.......\n nmsg.from.first_name\n➖➖➖➖➖➖➖➖➖➖➖\n.....\n msg.from.last_name\n➖➖➖➖➖➖➖➖➖➖➖\n....
\n msg.from.username\n➖➖➖➖➖➖➖➖➖➖➖\n.....\n msg.from.id\n➖➖➖➖➖➖➖➖➖➖➖\n.....\n
msg.to.print_name\n ➖➖➖➖➖➖➖➖➖➖➖\n.....\n msg.to.id\n➖➖➖➖➖➖➖➖➖➖➖\n........\n mgs.text\n ➖➖➖➖➖➖➖➖➖➖➖\n.....\n msg.id
 ]]
end

return {
  description = "نرخ گروه ها", 
  usage = "نرخ : نرخ گروه ها",
  patterns = {
    "^(نرخ)$"
  }, 
  run = run 
}

end

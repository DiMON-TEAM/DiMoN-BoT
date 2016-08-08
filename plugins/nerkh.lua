do

function run(msg, matches)
  return ':)'
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

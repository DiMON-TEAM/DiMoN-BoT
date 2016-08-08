local function run(msg, matches)
if matches[1] == 'time' then
    local cmd = io.popen('curl http://api.magic-team.ir/time.php')
      local result = cmd:read('*all')
    cmd:close()
    return result
end
end

return {
patterns = {
"^[/#!][Tt](ime)$",
},
run = run
}

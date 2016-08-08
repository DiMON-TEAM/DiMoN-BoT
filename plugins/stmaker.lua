do

local function run(msg, matches)
if matches[1]:lower() == 't2s' then
        local text = URL.escape(matches[2])
        local color = 'blue'
        if matches[3] == 'red' then
            color = 'red'
        elseif matches[3] == 'black' then
            color = 'black'
      elseif matches[3] == 'blue' then
          color = 'blue'
    elseif matches[3] == 'green' then
        color = 'green'
    elseif matches[3] == 'yellow' then
        color = 'yellow'
    elseif matches[3] == 'pink' then
        color = 'magenta'
    elseif matches[3] == 'orange' then
        color = 'Orange'
    elseif matches[3] == 'brown' then
        color = 'DarkOrange'
        end
        local font = 'mathrm'
        if matches[4] == 'bold' then
            font = 'mathbf'
        elseif matches[4] == 'italic' then
            font = 'mathit'
        elseif matches[4] == 'fun' then
            font = 'mathfrak'
        elseif matches[4] == 'arial' then
            font = 'mathrm'
        end
        local size = '700'
        if matches[5] == 'small' then 
            size = '300'
        elseif matches[5] == 'larg' then
            size = '900'
 end
local url = 'http://latex.codecogs.com/png.latex?'..'\\dpi{'..size..'}%20\\huge%20\\'..font..'{{\\color{'..color..'}'..text..'}}'
local file = download_to_file(url,'file.webp')
if msg.to.type == 'chat' then
send_document('chat#id'..msg.to.id,file,ok_cb,false)
end
end
end
return {
  patterns = {
 "^[!/#](t2s) (.*) ([^%s]+) (.*) (small)$",
 "^[!/#](t2s) (.*) ([^%s]+) (.*) (larg)$",
 "^[!/#](t2s) (.*) ([^%s]+) (.*) (%d+)$",
 "^[!/#](t2s) (.*) ([^%s]+) (bold)$",
 "^[!/#](t2s) (.*) ([^%s]+) (italic)$",
 "^[!/#](t2s) (.*) ([^%s]+) (fun)$",
 "^[!/#](t2s) (.*) ([^%s]+) (arial)$",
 "^[!/#](t2s) (.*) (red)$",
 "^[!/#](t2s) (.*) (black)$",
 "^[!/#](t2s) (.*) (blue)$",
 "^[!/#](t2s) (.*) (green)$",
 "^[!/#](t2s) (.*) (yellow)$",
 "^[!/#](t2s) (.*) (pink)$",
 "^[!/#](t2s) (.*) (orange)$",
 "^[!/#](t2s) (.*) (brown)$",
 "^[!/#](t2s) +(.*)$",
 "^([Tt]2s) (.*) ([^%s]+) (.*) (small)$",
 "^([Tt]2s) (.*) ([^%s]+) (.*) (larg)$",
 "^([Tt]2s) (.*) ([^%s]+) (.*) (%d+)$",
 "^([Tt]2s) (.*) ([^%s]+) (bold)$",
 "^([Tt]2s) (.*) ([^%s]+) (italic)$",
 "^([Tt]2s) (.*) ([^%s]+) (fun)$",
 "^([Tt]2s) (.*) ([^%s]+) (arial)$",
 "^([Tt]2s) (.*) (red)$",
 "^([Tt]2s) (.*) (black)$",
 "^([Tt]2s) (.*) (blue)$",
 "^([Tt]2s) (.*) (green)$",
 "^([Tt]2s) (.*) (yellow)$",
 "^([Tt]2s) (.*) (pink)$",
 "^([Tt]2s) (.*) (orange)$",
 "^([Tt]2s) (.*) (brown)$",
 "^([Tt]2s) +(.*)$"
  },
  run = run,
  }
  end

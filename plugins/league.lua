local function action(msg, matches,ln)
  if matches[1] == 'tleague' then
    local url = 'http://www.top90.ir/iran/persian-gulf-league'
  local res,code = HTTP.request(url)
res = res:gsub('.*<table class="lt show">',''):gsub('</table>.*',''):gsub('&ndash;','')
local text = ''
local i = 1
for teams in res:gmatch('<td class="ltid">[^<]*</td><td class="ltn">[^<]*</td><td class="ltg">[^<]*</td><td class="ltw">[^<]*</td><td class="ltd">[^<]*</td><td class="ltl">[^<]*</td><td class="ltgf">[^<]*</td><td class="ltga">[^<]*</td><td class="ltgd" dir="ltr">[^<]*</td><td class="ltp">[^<]*</td>') do
local tinfo = {teams:match('<td class="ltid">([^<]*)</td><td class="ltn">([^<]*)</td><td class="ltg">([^<]*)</td><td class="ltw">([^<]*)</td><td class="ltd">([^<]*)</td><td class="ltl">([^<]*)</td><td class="ltgf">([^<]*)</td><td class="ltga">([^<]*)</td><td class="ltgd" dir="ltr">([^<]*)</td><td class="ltp">([^<]*)</td>')}
text = text..make_text(lang[ln].leauge.table,i,tinfo[2],tinfo[10])..'\n\n'
i = i + 1
end
text = text..lang[ln].leauge.table_h
api.sendReply(msg,text)
  elseif matches[1] == 'teaminfo' then
    local url = 'http://www.top90.ir/iran/persian-gulf-league'
  local res,code = HTTP.request(url)
res = res:gsub('.*<table class="lt show">',''):gsub('</table>.*',''):gsub('&ndash;','')
local text = ''
local i = 1
for teams in res:gmatch('<td class="ltid">[^<]*</td><td class="ltn">[^<]*</td><td class="ltg">[^<]*</td><td class="ltw">[^<]*</td><td class="ltd">[^<]*</td><td class="ltl">[^<]*</td><td class="ltgf">[^<]*</td><td class="ltga">[^<]*</td><td class="ltgd" dir="ltr">[^<]*</td><td class="ltp">[^<]*</td>') do
if i == tonumber(matches[2]) then
local tinfo = {teams:match('<td class="ltid">([^<]*)</td><td class="ltn">([^<]*)</td><td class="ltg">([^<]*)</td><td class="ltw">([^<]*)</td><td class="ltd">([^<]*)</td><td class="ltl">([^<]*)</td><td class="ltgf">([^<]*)</td><td class="ltga">([^<]*)</td><td class="ltgd" dir="ltr">([^<]*)</td><td class="ltp">([^<]*)</td>')}
text = text..make_text(lang[ln].leauge.tinfo_1,tinfo[2],tinfo[3],tinfo[10],tinfo[4],tinfo[5])..make_text(lang[ln].leauge.tinfo_2,tinfo[6],tinfo[7],tinfo[8],tinfo[9])
end
i = i + 1
end
if text == '' then
text = lang[ln].leauge.tinfo_nf
end
api.sendReply(msg,text)
  end
  end
local iaction = function(inline, matches)
local photo1_url = 'https://upload.wikimedia.org/wikipedia/en/1/17/IPLlogo.png'
local ln = matches[2] or 'fa'
  local text = ''
	local qresult = {}
	local url = 'http://www.top90.ir/iran/persian-gulf-league'
	local res,code = HTTP.request(url)
	res = res:gsub('.*<table class="lt show">',''):gsub('</table>.*',''):gsub('&ndash;','')
	local i = 1
	for teams in res:gmatch('<td class="ltid">[^<]*</td><td class="ltn">[^<]*</td><td class="ltg">[^<]*</td><td class="ltw">[^<]*</td><td class="ltd">[^<]*</td><td class="ltl">[^<]*</td><td class="ltgf">[^<]*</td><td class="ltga">[^<]*</td><td class="ltgd" dir="ltr">[^<]*</td><td class="ltp">[^<]*</td>') do
	local textt = ''
local tinfo = {teams:match('<td class="ltid">([^<]*)</td><td class="ltn">([^<]*)</td><td class="ltg">([^<]*)</td><td class="ltw">([^<]*)</td><td class="ltd">([^<]*)</td><td class="ltl">([^<]*)</td><td class="ltgf">([^<]*)</td><td class="ltga">([^<]*)</td><td class="ltgd" dir="ltr">([^<]*)</td><td class="ltp">([^<]*)</td>')}
text = text..make_text(lang[ln].leauge.table,i,tinfo[2],tinfo[10])..'\n\n'
textt = textt..make_text(lang[ln].leauge.tinfo_1,tinfo[2],tinfo[3],tinfo[10],tinfo[4],tinfo[5])..make_text(lang[ln].leauge.tinfo_2,tinfo[6],tinfo[7],tinfo[8],tinfo[9])
	local qress = {}
	qress['id'] = tostring(i + 1)
	qress['title'] = tinfo[2]
	qress['type'] = 'article'
	qress['description'] = 'team info ...'
	qress['thumb_url'] = photo1_url
	qress['message_text'] = textt
	qresult[i+1] = qress
	i = i + 1
end
	local qress = {}
	qress['id'] = '1'
	qress['title'] = 'list'
	qress['type'] = 'article'
	qress['description'] = 'league list ...'
	qress['thumb_url'] = photo1_url
	qress['message_text'] = text
	qresult[1] = qress
	api.sendInline(inline.id, qresult,0)
end
local on_each_inline = function(inline,ln,each_count)
	local url = 'http://www.top90.ir/iran/persian-gulf-league'
	local res,code = HTTP.request(url)
	res = res:gsub('.*<table class="lt show">',''):gsub('</table>.*',''):gsub('&ndash;','')
	local text = ''
	for teams in res:gmatch('<td class="ltid">[^<]*</td><td class="ltn">[^<]*</td><td class="ltg">[^<]*</td><td class="ltw">[^<]*</td><td class="ltd">[^<]*</td><td class="ltl">[^<]*</td><td class="ltgf">[^<]*</td><td class="ltga">[^<]*</td><td class="ltgd" dir="ltr">[^<]*</td><td class="ltp">[^<]*</td>') do
local tinfo = {teams:match('<td class="ltid">([^<]*)</td><td class="ltn">([^<]*)</td><td class="ltg">([^<]*)</td><td class="ltw">([^<]*)</td><td class="ltd">([^<]*)</td><td class="ltl">([^<]*)</td><td class="ltgf">([^<]*)</td><td class="ltga">([^<]*)</td><td class="ltgd" dir="ltr">([^<]*)</td><td class="ltp">([^<]*)</td>')}
text = text..make_text(lang[ln].leauge.table,i,tinfo[2],tinfo[10])..'\n\n'
end
  local photo1_url = 'https://upload.wikimedia.org/wikipedia/en/1/17/IPLlogo.png'
	local qresult = {}
	qresult.id= tostring(each_count)
	qresult.title = 'league bartar'
	qresult.type = 'article'
	qresult.description = 'league list ...'
	qresult.thumb_url = photo1_url
	qresult.message_text = text
	return qresult
	end
return {
   triggers = {
"^[/!](tleague)$",
"^[/!](teaminfo) (%d+)$"
   },
   itriggers = {
"^(league) (fa)$",
"^(league) (fa)$",
"^(league)$"
   },
   iaction = iaction,
   on_each_inline = on_each_inline,
   action = action
}
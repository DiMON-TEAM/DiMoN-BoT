--[[
################################
#                              #
#           Welcome            #
#                              #
#                              #
#    by @Dragon_Born "Arian"   #
#                              #
#                              #
#    Modified by GPMod Team    #
#	                       #
#                              #
#     Update: 7 June 2016      #
#                              #
#                              #
#           @GPMod             #
#                              #
################################
]]

local function run(msg, matches)
local data = load_data(_config.moderation.data)
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return 
      end
      local receiver = get_receiver(msg)
	if is_banned(msg.action.user.id, msg.to.id) then
	        return
		end
		if is_gbanned(msg.action.user.id) then
            return
        end
local nicebekhodam = ''
	if data[tostring(msg.to.id)]['welcome'] == 'فعال' then
	if data[tostring(msg.to.id)]['welcome_msg'] then
	local message = data[tostring(msg.to.id)]['welcome_msg']
	local Usernames = ''
	   local hash = 'rank:'..msg.to.id..':variables'
		local value = redis:hget(hash, msg.action.user.id)
		 if not value then
		    if msg.action.user.first_name then
                   Usernames = msg.action.user.first_name
		    else
                   Usernames = msg.action.user.last_name
		  end
		  else
		   Usernames = value
		 end
if string.match(message, '{name}') then
        message = string.gsub(message, '{name}', Usernames)
end

	if string.match(message, '{group}') then
        local grouppp = ''
        if string.match(msg.to.print_name, '_') then
        grouppp = string.gsub(msg.to.print_name, '_', ' ')
        else grouppp = msg.to.print_name end
		message = string.gsub(message, '{group}',  grouppp)
	end


if string.match(message, '{rules}') then
  local data_catt = 'rules'
local rulessss = ''
  if not data[tostring(msg.to.id)][data_catt] then
   rulessss = 'گروه قانونی ندارد!'
  else
  rulessss = data[tostring(msg.to.id)][data_catt]
  end
  message = string.gsub(message, '{rules}',  rulessss)
end

	return message
	else
     return 'سلام '..(msg.action.user.first_name or msg.action.user.last_name)..'\nبه گروه '.. string.gsub(msg.to.print_name, '_', ' ')..' خوش اومدی'
	 end
    end

    end
	
	    if matches[1] == 'chat_add_user_link' then
      if not msg.service then
        return 
      end
      local receiver = get_receiver(msg)
	if is_banned(msg.from.id, msg.to.id) then
	        return
		end
		if is_gbanned(msg.from.id) then
            return
        end
	if data[tostring(msg.to.id)]['welcome'] == 'فعال' then
	if data[tostring(msg.to.id)]['welcome_msg'] then
	local message = data[tostring(msg.to.id)]['welcome_msg']
	local Usernames = ''
	   local hash = 'rank:'..msg.to.id..':variables'
		local value = redis:hget(hash, msg.from.id)
		 if not value then
		    if msg.action.user.first_name then
                   Usernames = msg.action.user.first_name
		    else
                   Usernames = msg.action.user.last_name
		  end
		  else
		   Usernames = value
		 end
	if string.match(message, '{name}') then
		message = string.gsub(message, '{name}', Usernames)
	end

	if string.match(message, '{group}') then
        local grouppp = ''
        if string.match(msg.to.print_name, '_') then
        grouppp = string.gsub(msg.to.print_name, '_', ' ')
        else grouppp = msg.to.print_name end
		message = string.gsub(message, '{group}',  grouppp)
	end
	if string.match(message, '{rules}') then
	  local data_catt = 'rules'
	local rulessss = ''
	  if not data[tostring(msg.to.id)][data_catt] then
	   rulessss = 'گروه قانونی ندارد'
	  else
	  rulessss = data[tostring(msg.to.id)][data_catt]
end
	  message = string.gsub(message, '{rules}',  rulessss)
	end
	return message
	else
     return 'سلام '..(msg.from.first_name or msg.from.last_name)..'\nبه گروه '.. string.gsub(msg.to.print_name, '_', ' ')..' خوش آمدی'
	 end
    end

    end
end


return {
  patterns = {
    "^!!tgservice (chat_add_user)$",
	"^!!tgservice (chat_add_user_link)$",

  },
  run = run
}

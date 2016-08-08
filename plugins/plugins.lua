do

-- Returns the key (index) in the config.enabled_plugins table
local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  -- If not found
  return false
end

-- Returns true if file exists in plugins folder
local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✔️ enabled, ❌️ disabled
    local status = '❌'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '✔️' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '✔️' then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'. '..v..'  '..status..'\n'
    end
  end
  local text = text..'\nشما '..nsum..' پلایگن نصب کردید.\n'..nact..' پلایگن فعال است و '..nsum-nact..' پلایگن غیر فعال است'
  return text
end

local function list_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    --  ✔️ enabled, ❌️ disabled
    local status = '❌'
    nsum = nsum+1
    nact = 0
    -- Check if is enabled
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '✔️' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '✔️' then
      -- get the name
      v = string.match (v, "(.*)%.lua")
      text = text..v..'  '..status..'\n'
    end
  end
  local text = text..'\n'..nact..' پلایگن فعال شد از '..nsum..' پلایگن های نصب شده'
  return text
end

local function reload_plugins( )
  plugins = {}
  load_plugins()
  return list_plugins(true)
end


local function enable_plugin( plugin_name )
  print('checking if '..plugin_name..' exists')
  -- Check if plugin is enabled
  if plugin_enabled(plugin_name) then
    return 'پلایگن '..plugin_name..' فعال شد'
  end
  -- Checks if plugin exists
  if plugin_exists(plugin_name) then
    -- Add to the config table
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
    save_config()
    -- Reload the plugins
    return reload_plugins( )
  else
    return 'پلایگن '..plugin_name..' وجود ندارد'
  end
end

local function disable_plugin( name, chat )
  -- Check if plugins exists
  if not plugin_exists(name) then
    return 'پلایگن '..name..' وجود ندارد'
  end
  local k = plugin_enabled(name)
  -- Check if plugin is enabled
  if not k then
    return 'پلایگن '..name..' فعال نشده است'
  end
  -- Disable and reload
  table.remove(_config.enabled_plugins, k)
  save_config( )
  return reload_plugins(true)    
end

local function disable_plugin_on_chat(receiver, plugin)
  if not plugin_exists(plugin) then
    return "پلایگن مورد نظر شما وجود ندارد"
  end

  if not _config.disabled_plugin_on_chat then
    _config.disabled_plugin_on_chat = {}
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    _config.disabled_plugin_on_chat[receiver] = {}
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = true

  save_config()
  return 'پلایگن '..plugin..' در این چت غیر فعال شد'
end

local function reenable_plugin_on_chat(receiver, plugin)
  if not _config.disabled_plugin_on_chat then
    return 'پلایگن غیر فعالی وجود ندارد'
  end

  if not _config.disabled_plugin_on_chat[receiver] then
    return 'پلایگن غیر فعال در این چت وجود ندارد'
  end

  if not _config.disabled_plugin_on_chat[receiver][plugin] then
    return 'این پلایگن فعال نیست'
  end

  _config.disabled_plugin_on_chat[receiver][plugin] = false
  save_config()
  return 'پلایگن '..plugin..' دوباره فعال شد'
end

local function run(msg, matches)
  -- Show the available plugins 
  if matches[1] == '!plugins' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    return list_all_plugins()
  end

  -- Re-enable a plugin for this chat
  if matches[1] == 'enable' and matches[3] == 'chat' then
    local receiver = get_receiver(msg)
    local plugin = matches[2]
    print("enable "..plugin..' on this chat')
    return reenable_plugin_on_chat(receiver, plugin)
  end

  -- Enable a plugin
  if matches[1] == 'enable' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    local plugin_name = matches[2]
    print("enable: "..matches[2])
    return enable_plugin(plugin_name)
  end

  -- Disable a plugin on a chat
  if matches[1] == 'disable' and matches[3] == 'chat' then
    local plugin = matches[2]
    local receiver = get_receiver(msg)
    print("disable "..plugin..' on this chat')
    return disable_plugin_on_chat(receiver, plugin)
  end

  -- Disable a plugin
  if matches[1] == 'disable' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    if matches[2] == 'plugins' then
    	return 'این پلایگن نمی تواند غیر فعال شود'
    end
    print("disable: "..matches[2])
    return disable_plugin(matches[2])
  end

  -- Reload all the plugins!
  if matches[1] == 'reload' and is_sudo(msg) then --after changed to moderator mode, set only sudo
    return reload_plugins(true)
  end
end

return {
  description = "Plugin to manage other plugins. Enable, disable or reload.", 
  usage = {
      moderator = {
          "!plugins disable [plugin] chat : disable plugin only this chat.",
          "!plugins enable [plugin] chat : enable plugin only this chat.",
          },
      sudo = {
          "!plugins : list all plugins.",
          "!plugins enable [plugin] : enable plugin.",
          "!plugins disable [plugin] : disable plugin.",
          "!plugins reload : reloads all plugins." },
          },
  patterns = {
    "^!plugins$",
    "^!plugins? (enable) ([%w_%.%-]+)$",
    "^!plugins? (disable) ([%w_%.%-]+)$",
    "^!plugins? (enable) ([%w_%.%-]+) (chat)",
    "^!plugins? (disable) ([%w_%.%-]+) (chat)",
    "^!plugins? (reload)$" },
  run = run,
  moderated = true, -- set to moderator mode
  --privileged = true
}

end
-- مدیر : @mohammadarak
-- ربات : @avirabot
-- هر گونه کپی برداری بدون ذکر منبع حرام است 

[# [DiMoN-BOT](https://telegram.me/DiMoN_TM)
# Let's install the bot.
cd $HOME
git clone https://github.com/DiMoN-TEAM/DiMoN-BoT.git -b supergroups
cd DiMoN-BoT
chmod +x launch.sh
./launch.sh install
./launch.sh # Enter a phone number & confirmation code.
```
To install everything in one command (useful for VPS deployment) on Debian-based distros, use:
```sh
#https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get update; sudo apt-get upgrade -y --force-yes; sudo apt-get dist-upgrade -y --force-yes; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev libjansson* libpython-dev make unzip git redis-server g++ autoconf -y --force-yes && git clone https://github.com/SEEDTEAM/TeleSeed.git -b supergroups && cd TeleSeed && chmod +x launch.sh && ./launch.sh install && ./launch.sh`
```
<html>DiMoN</html><code>BoT</code><b>developer</b><i>MasTer</i><rtl>DiMoN<rtl>
* * *

### Realm configuration

After you run the bot for first time, send it `!id`. Get your ID and stop the bot.

Open ./data/config.lua and add your ID to the "sudo_users" section in the following format:
```
  sudo_users = {
   
    YourID
  }
```
Then restart the bot.

Create a realm using the `!createrealm` command.

* * *

**Creating a LOG SuperGroup**
	-For GBan Log

	1. Create a group using the `!creategroup` command.
	2. Add two members or bots, then use `#Tosuper` to convert to a SuperSroup.
	3. Use the `#addlog` command and your ***LOG SuperGroup(s)*** will be set.
	Note: you can set multiple Log SuperGroups

* * *

# Support and development
# [Support](https://telegram.me/DiMoN_TM)
# [developer](https://telegram.me/DiMoN_Official)
* * *

# Our team!

[GiT-MasTer-DiMoN](https://github.com/DiMoN-TEAM) ([Telegram](https://telegram.me/DiMoN_Official))
# please share
`TNX`_SEED_ *TEAM*](https://telegram.me/DiMoN_TM)

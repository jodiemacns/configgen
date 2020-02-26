# Programs...
# Tmux
# Ranger
# Mutt or neomutt
# offlineimap
# calcurse
# msmtp
# caca-utils
# surfraw

#git clone https://github.com/LukeSmithxyz/mutt-wizard
#cd mutt-wizard
#sudo make install
#sudo apt install isync msmtp pass

#Oldschool ASCII art previews can be enabled like this:
#
#install libcaca (or whatever package provides the "img2txt" executable)
#get a current scope.sh config, e.g. with ranger --copy-config=scope
#The following ~/.config/ranger/rc.conf settings are also essential, though the default rc.conf already includes them, so usually you don't need to change anything.
#set preview_images false
#set use_preview_script true
#set preview_script ~/path/to/your/scope.sh
#set preview_images false is necessary because otherwise ranger might use full color previews instead.

#chmod 600 ~/.msmtprc

#if [ ! -d "~/Mail" ]; then
#        mkdir ~/Mail
#fi
#./install_apps.sh $(cat apps.list)
rm -fr ~/.config/awesome
cp -fr ~/configgen/awesome ~/.config/awesome
rm -fr ~/configgen/awesome
echo "source ~/configgen/bashrc" >> ~/.bashrc
./refreshlinks.sh

#echo "export EDITOR=vim" >> ~/.bashrc
#echo "export PATH=\$PATH:~/config/" >> ~/.bashrc
#echo "export PATH=\$PATH:~/config/bin/" >> ~/.bashrc
#echo "export GOPATH=~/go" >> ~/.bashrc
#echo "export RTV_BROWSER=w3m" >> ~/.bashrc
#echo "export BROWSER=w3m" >> ~/.bashrc
#echo "export TZ=Canada/Atlantic" >> ~/.bashrc

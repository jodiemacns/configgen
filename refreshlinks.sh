#if [ ! -d "~/code" ]; then
#        mkdir ~/code
#     fi
#if [ ! -d "~/.config" ]; then
#        mkdir ~/.config
#     fi
mkdir -p ~/code
mkdir -p ~/.config
mkdir -p ~/.config/ranger
mkdir -p ~/.calcurse
mkdir -p ~/.weechat
mkdir -p ~/.w3m

ln -s -f ~/configgen/mutt-wiz/.mutt ~/.mutt
ln -s -f ~/configgen/mutt-wiz/msmtp ~/.config/msmtp
ln -s -f ~/configgen/gpg-agent.conf ~/.gnupg/gpg-agent.conf

ln -s -f ~/configgen/.vim ~/.vim
ln -s -f ~/configgen/.vim/.vimrc ~/.vimrc
ln -s -f ~/configgen/rc.conf ~/.config/ranger/rc.conf
ln -s -f ~/configgen/.apts ~/.calcurse/apts
ln -s -f ~/configgen/todo ~/.calcurse/todo
ln -s -f ~/configgen/.tmux.conf ~/.tmux.conf
ln -s -f ~/configgen/bookmark.html ~/.w3m/bookmark.html
ln -s -f ~/configgen/.Xdefaults ~/.Xdefaults
ln -s -f ~/configgen/.tigrc ~/.tigrc
ln -s -f ~/configgen/.ti99sim ~/.ti99sim
ln -s -f ~/configgen/.xinitrc ~/.xinitrc

cp -fr ~/configgen/awesome ~/.config/awesome
convertawesome.sh



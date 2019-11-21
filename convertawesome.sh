cat ~/.config/awesome/rc.lua | sed "s/homedir/$USER/" > rc.lua 
cat ~/.config/awesome/themes/default/theme.lua  | sed "s/homedir/$USER/" > theme.lua 

mv ./rc.lua    ~/.config/awesome/rc.lua
mv ./theme.lua ~/.config/awesome/themes/default/theme.lua

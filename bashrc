export EDITOR=vim
export PATH=$PATH:~/config/
export PATH=$PATH:~/config/bin/
export GOPATH=~/go
export RTV_BROWSER=w3m
export BROWSER=w3m
export TZ=Canada/Atlantic
#set -o vi
alias s_duck='sr -browser=w3m duckduckgo'
alias s_w='sr -browser=w3m wikipedia'
alias w_sw='sr -browser=firefox wikipedia'
alias w_sduck='sr -browser=firefox duckduckgo'
alias s_g='sr -browser=w3m google'
alias s_q='sr -browser=w3m stockquote'
alias w_sq='sr -browser=firefox stockquote'
alias w_sg='sr -browser=firefox google'
alias tmuxk='tmux kill-session'
alias bm='w3m ~/config/bookmark.html'
alias sshterm='xterm -fn 9x15 -e ssh jodie@192.168.0.2 &'

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0232323" #black
    echo -en "\e]P82B2B2B" #darkgrey
    echo -en "\e]P1D75F5F" #darkred
    echo -en "\e]P9E33636" #red
    echo -en "\e]P287AF5F" #darkgreen
    echo -en "\e]PA98E34D" #green
    echo -en "\e]P3D7AF87" #brown
    echo -en "\e]PBFFD75F" #yellow
    echo -en "\e]P48787AF" #darkblue
    echo -en "\e]PC7373C9" #blue
    echo -en "\e]P5BD53A5" #darkmagenta
    echo -en "\e]PDD633B2" #magenta
    echo -en "\e]P65FAFAF" #darkcyan
    echo -en "\e]PE44C9C9" #cyan
    echo -en "\e]P7E5E5E5" #lightgrey
    echo -en "\e]PFFFFFFF" #white
    clear #for background artifacting
fi

~/config/randomjoke_seinfeld.sh

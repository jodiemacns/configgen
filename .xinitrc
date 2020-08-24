xrdb ~/.Xdefaults
xset r rate 400 50
xrandr
xrandr --output Virtual1 --mode "2560x1440"
pulseaudio --start &
export _JAVA_AWT_WM_NONREPARENTING=1
export JAVA_AWT_WM_NONREPARENTING=1
exec slstatus&
exec feh --bg-scale ~/configgen/bg.png&
exec dwm 

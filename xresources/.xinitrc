#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Keyboardlayout
setxkbmap de &

# compositor
picom -f &

# restore wallpaper
~/.fehbg &

# set display brightness for secondary monitor
xrandr --output DP-2 --brightness .9 &

# start autolocker
xautolock -time 10 -locker slock &
xset -dpms &
xset s off &
xset r rate 300 50 &

# auto disk mounting
udiskie &

# fix java for java is being java....
export AWT_TOOLKIT=MToolkit
export GTK_THEME=Breeze:dark

# execture dwm
while true; do
    dwm >/dev/null 2>&1
done

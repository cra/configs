#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

. ~/.xinitrc.common

#dropboxd &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

/usr/bin/asus-kbd-backlight allowusers
udiskie &
stalonetray &
parcellite --no-icon &
hsetroot -fill ~/.wallpaper-emma.jpg

ssh-agent notion
#openbox


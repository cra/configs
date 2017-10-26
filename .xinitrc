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

NOTION=1

udiskie --smart-tray &
parcellite --no-icon &
xpad --no-new &
stalonetray &
batterymon -n 40 -c 22 -e 'notify-send -u critical "Find a charger! QUICK"' &

hsetroot -fill ~/.wallpaper-transformer.jpg
ssh-agent notion

# Presentation mode
#hsetroot -fill ~/.wallpaper-science.png
#ssh-agent openbox

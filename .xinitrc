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

if [ $NOTION == 1 ]
then
#YOBA
        hsetroot -fill ~/.wallpaper-transformer.jpg
        exec dbus-launch &
        ##dunst??
        remind -z '-knotify-send -t 0 -u critical %s &' ~/.reminders &

        ssh-agent notion
#YOBA
else
        hsetroot -fill .wallpaper_sips.jpg
        ssh-agent openbox
fi


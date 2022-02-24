#!/bin/sh

eval "$(dbus-launch --auto-syntax)" # for spotify media keys
hostname=$(hostname)
[ "$hostname" = "$PC" ] && xrandr --output DP-0 --left-of DP-4
hashwall -s 12
sxhkd &
xsetroot -cursor_name left_ptr &
[ "$hostname" = "$PC" ] && setxkbmap us
[ "$hostname" = "$LAPTOP" ] && gebaard -b && pulseaudio-ctl mute-input && pactl load-module module-bluetooth-discover
xset m 1/1 3 # mouse speed
unclutter &
redshift -l 53.33306:-6.24889 &
picom -b
[ "$hostname" = "$LAPTOP" ] && [ $(xrandr -q | grep ' connected' | wc -l) -ge 2 ] && sd wm docked
exec bspwm

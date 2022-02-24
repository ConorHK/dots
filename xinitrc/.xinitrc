#!/bin/sh

eval "$(dbus-launch --auto-syntax)" # for spotify media keys
hostname=$(hostname)
[ "$hostname" = "atlantic" ] && xrandr --output DP-0 --left-of DP-4
hashwall -s 12
sxhkd &
xsetroot -cursor_name left_ptr &
[ "$hostname" = "atlantic" ] && setxkbmap us
[ "$hostname" = "pacific" ] && gebaard -b && pulseaudio-ctl mute-input && pactl load-module module-bluetooth-discover
xset m 1/1 3 # mouse speed
unclutter &
redshift -l 53.33306:-6.24889 &
picom -b
[ "$hostname" = "pacific" ] && [ $(xrandr -q | grep ' connected' | wc -l) -ge 2 ] && docked
exec bspwm

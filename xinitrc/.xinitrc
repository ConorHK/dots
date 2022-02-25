#!/usr/bin/env sh

eval "$(dbus-launch --auto-syntax)" # for spotify media keys
sd-wallpaper
sxhkd &
xsetroot -cursor_name left_ptr &
[ "$HOSTNAME" = "$PC" ] && setxkbmap us
[ "$HOSTNAME" = "$PC" ] && xrandr --output DP-0 --left-of DP-4
[ "$HOSTNAME" = "$LAPTOP" ] &&  pactl load-module module-bluetooth-discover
xset m 1/1 3 # mouse speed
unclutter &
redshift -l 53.33306:-6.24889 &
picom -b
[ "$HOSTNAME" = "$LAPTOP" ] && [ $(xrandr -q | grep ' connected' | wc -l) -ge 2 ] && sd-docked
exec bspwm

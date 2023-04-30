#!/usr/bin/env sh

eval "$(dbus-launch --auto-syntax)" # for spotify media keys
wm-wallpaper
sxhkd &
xsetroot -cursor_name left_ptr &
[ "$HOSTNAME" = "$PC" ] && setxkbmap us
[ "$HOSTNAME" = "$LAPTOP" ] && setxkbmap gb
[ "$HOSTNAME" = "$PC" ] && xrandr --output DP-2 --left-of DP-4
[ "$HOSTNAME" = "$LAPTOP" ] && pactl load-module module-bluetooth-discover && batsignal -b
setxkbmap -option "caps:swapescape"
xset m 1/1 3 # mouse speed
unclutter &
redshift -l 53.33306:-6.24889 &
picom -b --config "$XDG_CONFIG_HOME"/picom/picom.conf
[ "$HOSTNAME" = "$LAPTOP" ] && [ "$(xrandr -q | grep ' connected' | wc -l)" -ge 2 ] && wm-docked
exec bspwm

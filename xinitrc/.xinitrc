#!/bin/sh

eval "$(dbus-launch --auto-syntax)" # for spotify media keys
hostname=$(hostname)
[ "$hostname" = "atlantic" ] && xrandr --output DP-0 --left-of DP-4
noisewall "#432f2f"
sxhkd &
xsetroot -cursor_name left_ptr &
[ "$hostname" = "atlantic" ] && setxkbmap us  || setxkbmap gb && setxkbmap -option "caps:swapescape"
[ "$hostname" = "pacific" ] && gebaard -b
xset m 1/1 3 # mouse speed
unclutter &
exec bspwm

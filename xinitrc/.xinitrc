#!/bin/sh

eval `dbus-launch --auto-syntax` # for spotify media keys
hostname=$(hostname)
[[ "$hostname" =~ pc ]] && xrandr --output DP-0 --left-of DP-4
hashwall -f '#131313' -b '#1e1b1c' -s 12
sxhkd &
xsetroot -cursor_name left_ptr &
[[ "$hostname" =~ pc ]] && setxkbmap us  || setxkbmap gb && setxkbmap -option "caps:swapescape"
[[ "$hostname" =~ laptop ]] && gebaard -b
xset m 1/1 3 # mouse speed
unclutter &
exec bspwm

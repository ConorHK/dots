#!/bin/sh

active_sink=$(pactl list short | grep RUNNING | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)

HEADPHONES=$(pactl list short | grep "alsa_output.usb-Plantronics" | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
SPEAKERS=$(pactl list short | grep alsa_output.pci-0000_01_00.1.hdmi-stereo | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1)
MUTED=$(pactl list sinks | grep -A 10 "Sink #$active_sink$" | grep "Mute: yes" | wc -w)

function volume() {
  volume=$([ "$MUTED" -ne 0 ] && echo MUTED || echo "$(pactl list sinks | grep -A 10 "Sink #$active_sink$" | grep "Volume" | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%")
  echo "$volume"
}

function status() {
  [[ $active_sink -eq $SPEAKERS ]] && echo "Speakers" || echo "Headphones"
}

function usage() {
  printf "Options:\n> toggle\n> volume-up\n> volume-down\n> swap-output \n> status\n> volume\n> set-hdmi\n> help\n"
}

function set_hdmi() {
  pactl set-card-profile 0 output:hdmi-stereo-extra2 # Enable correct HDMI config bc pulseaudio config seems to do nothing
  status

}

case "$1" in
  toggle ) pactl set-sink-mute $active_sink toggle ;;
  volume-up ) pactl set-sink-volume $active_sink +5% && volume;;
  volume-down ) pactl set-sink-volume $active_sink -5% && volume;;
  swap-output ) pactl list sink-inputs | grep "Sink Input" | sed 's/[^0-9]//g' | while read input; do [[ $active_sink -eq $SPEAKERS ]] && pactl move-sink-input $input $HEADPHONES || pactl move-sink-input $input $SPEAKERS; done ;;
  status ) status ;;
  volume ) volume ;;
  set-hdmi) set_hdmi ;; 
  help ) usage ;;
  * ) usage ;;
esac


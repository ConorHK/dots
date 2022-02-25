#!/bin/zsh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  source $ZDOTDIR/.zshrc
  exec startx
fi

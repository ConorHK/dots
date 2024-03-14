#!/bin/zsh

if [[ `uname` == "Darwin" ]]; then
   eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  source $ZDOTDIR/.zshrc
  exec startx
fi

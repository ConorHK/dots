#!/bin/sh
# Run by zsh on startup

hostname=$(hostname)

# Adds ~/bin to $PATH
export PATH="$PATH:$HOME/.local/bin:$(du "$HOME/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="wezterm"
export TERM="alacritty"
export BROWSER="firefox"
export READER="zathura"

# Locations
export ENV_FILE="$(pwd)/env.zsh"
export ALIASES="$(pwd)/aliases.zsh"

# $HOME Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE=-
export GTK2_RC_FILES="$HOME/.config/gtk-2/gtkrc-2.0"
export WGETRC="$HOME/.config/wget/wgetrc"
export ZDOTDIR="$HOME/.config/zsh"
export _Z_DATA="$XDG_DATA_HOME/z"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GOPATH="${XDG_DATA_HOME}/go"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export SSB_HOME="${XDG_DATA_HOME}/zoom" # zoom
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"

export SESSIONS="$XDG_CACHE_HOME/nvim/sessions"
export TEXMFHOME="$HOME/repositories/latextemplates"

if [ "$hostname" = "atlantic" ]; then
  export HEADPHONES="alsa_output.usb-Plantronics_Plantronics_HD1-00.analog-stereo"
  export SPEAKERS="alsa_output.pci-0000_01_00.1.hdmi-stereo"
else
  export SPEAKERS="alsa_output.pci-0000_00_1f.3.analog-stereo"
fi

#!/usr/bin/env sh

export HOSTNAME=$(hostname)
export LAPTOP="saturn"
export PC="jupiter"

# Default programs:
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export TERMINAL="alacritty"
if [ -n "$TMUX" ]; then
  export TERM="tmux-256color"
else
  export TERM="xterm-256color"
fi

export BROWSER="firefox"
export READER="zathura"

# $HOME Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Locations
export ENV_FILE="$(pwd)/env.zsh"
export ALIASES="$(pwd)/aliases.zsh"
export HISTFILE="$XDG_CACHE_HOME/zsh/.histfile"
if [[ ! -f "$HISTFILE" ]]; then
    mkdir -p "$XDG_CACHE_HOME/zsh"
    touch "$HISTFILE"
fi
export HISTSIZE=10000
export SAVEHIST=10000

export npm_config_cache="${XDG_CACHE_HOME}/npm"
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE=-
export GTK2_RC_FILES="$HOME/.config/gtk-2/gtkrc-2.0"
export ZDOTDIR="$HOME/.config/zsh"
export _Z_DATA="$XDG_DATA_HOME/z"
export PYLINTHOME="$XDG_CACHE_HOME/pylint"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GOPATH="${XDG_DATA_HOME}/go"
export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export SSB_HOME="${XDG_DATA_HOME}/zoom" # zoom
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME}/java"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"

export SESSIONS="$XDG_CACHE_HOME/nvim/sessions"
export TEXMFHOME="$HOME/repositories/latextemplates"

if [ "$HOSTNAME" = "$PC" ]; then
  export HEADPHONES="alsa_output.usb-Plantronics_Plantronics_HD1-00.analog-stereo"
  export SPEAKERS="alsa_output.pci-0000_01_00.1.hdmi-stereo-extra2"
else
  export SPEAKERS="alsa_output.pci-0000_00_1f.3.analog-stereo"
fi
export BOOM="bluez_output.C0_28_8D_85_86_D7.a2dp-sink"

# Java WM awt settings
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

if [[ -f "$ZDOTDIR/secrets.zsh" ]]; then
  source $ZDOTDIR/secrets.zsh
fi

export SD_ROOT=$HOME/scripts
export PATH="$PATH:$SD_ROOT/.scripts:$XDG_DATA_HOME/go/bin:$XDG_DATA_HOME/cargo/bin:$HOME/.local/bin"

export REMINDER_MESSAGES="$XDG_CACHE_HOME/reminders/messages"
export REMINDER_INDICATORS="$XDG_CACHE_HOME/reminders/indicators"

if [ -d "$XDG_CONFIG_HOME/nix" ]; then
  export NIX_CONFIG_DIR="$XDG_CONFIG_HOME/nix" 
fi

# export LS_COLORS='di=1;32:ln=1;30;47:so=30;45:pi=30;45:ex=1;31:bd=30;46:cd=30;46:su=30'
# export LS_COLORS="${LS_COLORS};41:sg=30;41:tw=30;41:ow=30;41:*.rpm=1;31:*.deb=1;31"

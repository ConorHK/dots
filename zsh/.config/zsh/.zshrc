# Source environment variables
source $HOME/.config/zsh/env.zsh

# Source aliases
source $ZDOTDIR/aliases.zsh

# Source functions
fpath=($ZDOTDIR/functions $fpath);
autoload -U $fpath[1]/*(.:t)

# set title on terminal spawn
precmd () {
    print -Pn "\e]0;%~\a"
}

# set title on command execution
preexec () {
    print -Pn "\e]0;$1\a"
}

# Make cd work like pushd
setopt auto_pushd

HISTFILE=$XDG_CACHE_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch
unsetopt beep

# ignore case in directory/file auto-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# key bindings
bindkey -v
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Load compinit
autoload -Uz compinit
compinit
setopt menu_complete
setopt auto_menu
setopt complete_in_word
setopt always_to_end
zstyle ':completion:*' menu select
zstyle ':completion:*' accept-exact-dirs true

# Prompt
source $ZDOTDIR/prompt.zsh

# Session SSH passphrase
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" &> /dev/null

# Source plugins
source $ZDOTDIR/plugins.zsh

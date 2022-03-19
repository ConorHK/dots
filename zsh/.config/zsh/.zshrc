source $HOME/.config/zsh/env.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/plugins.zsh
source $ZDOTDIR/prompt.zsh
fpath=($ZDOTDIR/functions $fpath);
autoload -U $fpath[1]/*(.:t)

setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups

setopt append_history          
setopt extended_history       
setopt no_hist_beep          
setopt hist_expire_dups_first
setopt hist_find_no_dups    
setopt hist_ignore_all_dups
setopt hist_ignore_dups   
setopt hist_ignore_space  
setopt hist_no_store     
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_verify 
setopt inc_append_history

setopt auto_menu
setopt complete_in_word
setopt always_to_end

setopt no_rm_star_silent 
setopt extended_glob
setopt no_beep

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

# Session SSH passphrase
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)" &> /dev/null

autoload -Uz compinit 
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
	compinit;
else
	compinit -C;
fi;

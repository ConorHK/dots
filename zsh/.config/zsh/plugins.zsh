mkdir -p $ZDOTDIR/pluginfiles

include_plugin () {
  IFS=/ read author name <<< $1
  if [ ! -d $ZDOTDIR/pluginfiles/$name ]
  then
    git clone https://github.com/$author/$name $ZDOTDIR/pluginfiles/$name
  fi
  source $ZDOTDIR/pluginfiles/$name/$name.zsh
}

include_plugin jeffreytse/zsh-vi-mode
include_plugin zsh-users/zsh-history-substring-search
include_plugin zsh-users/zsh-syntax-highlighting

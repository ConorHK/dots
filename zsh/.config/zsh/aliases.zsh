if command -v "exa" > /dev/null; then
  alias ls="exa --icons"
  alias l="exa --icons -la"
fi

if command -v "git" > /dev/null; then
  alias gs="git status"
  alias gc="git commit"
  alias ga="git add"
  alias gaa="git add --all"
  alias gd="git diff"
  alias gp="git push"
  alias gr="git rebase"
  alias gm="git merge"
fi

[ $(command -v "zathura") ] && alias pdf="zathura"
[ $(command -v "yay") ] && alias p="yay"
[ $(command -v "ranger") ] && alias ra="ranger"
[ $(command -v "nvim") ] && alias vim="nvim"
[ $(command -v "dragon-drag-and-drop") ] && alias dragon="dragon-drag-and-drop"
[ $(command -v "mpv") ] &&  [ "$HOSTNAME = "$LAPTOP ] && alias selfie="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"

alias rm="rm -i"
alias dr="dirs -v"
alias source-zsh="source $XDG_CONFIG_HOME/zsh/.zshrc"

if which "exa" > /dev/null; then
  alias ls="exa --icons"
  alias l="exa --icons -la"
fi

if which "git" > /dev/null; then
  alias gs="git status"
  alias gc="git commit"
  alias ga="git add"
  alias gaa="git add --all"
  alias gd="git diff"
  alias gp="git push"
  alias gr="git rebase"
  alias gm="git merge"
fi

[ which "zathura" &> /dev/null ] && alias pdf="zathura"
[ which "pacman" &> /dev/null ] && alias p="sudo pacman"
[ which "ranger" &> /dev/null ] && alias ra="ranger"
[ which "nvim" &> /dev/null ] && alias vim="nvim"
[ which "dragon-drag-and-drop" &> /dev/null ] && alias dragon="dragon-drag-and-drop"
[ which "spotifyd" &> /dev/null ] && alias spt="spotifyd && spt"
[ which "mpv" &> /dev/null ] &&  [ "$HOSTNAME = "$LAPTOP ] && alias selfie="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"

alias dr="dirs -v"
alias source-zsh="source $XDG_CONFIG_HOME/zsh/.zshrc"

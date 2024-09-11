if command -v "exa" > /dev/null; then
  alias ls="exa --icons"
  alias l="exa --icons -la"
else
  alias l="ls -la"
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
  alias goc="git open-remote"
  alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
fi

[ $(command -v "zathura") ] && alias pdf="zathura"
[ $(command -v "yay") ] && alias p="yay"
[ $(command -v "ranger") ] && alias ra="ranger"
[ $(command -v "nvim") ] && alias vim="nvim"
[ $(command -v "dragon-drag-and-drop") ] && alias dragon="dragon-drag-and-drop"
[ $(command -v "mpv") ] &&  [ "$HOSTNAME = "$LAPTOP ] && alias selfie="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
[ $(command -v "util-copy") ] && alias c="util-copy"

alias dr="dirs -v"
alias source-zsh="source $XDG_CONFIG_HOME/zsh/.zshrc"
[ $(command -v "nix") ] && alias nix="noglob nix"

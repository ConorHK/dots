if  type "exa" > /dev/null; then
  alias ls="exa --icons"
  alias l="exa --icons -la"
fi
if  type "zathura" > /dev/null; then
  alias pdf="zathura"
fi
if  type "pacman" > /dev/null; then
  alias p="sudo pacman"
fi
if  type "ranger" > /dev/null; then
  alias ra="ranger"
fi
if  type "nvim" > /dev/null; then
  alias vim="nvim"
fi
if type "dragon-drag-and-drop" > /dev/null; then
  alias dragon="dragon-drag-and-drop"
fi
if type "spotifyd" > /dev/null; then
  alias spt="spotifyd && spt"
fi

alias gt="git log --graph --decorate --pretty=oneline --abbrev-commit"
alias gs="git status"
alias gc="git commit"
alias ga="git add"
alias gaa="git add --all"
alias gd="git diff"
alias gp="git push"

alias dr="dirs -v"
alias source-zsh="source $XDG_CONFIG_HOME/zsh/.zshrc"
[[ "$HOSTNAME" == "$LAPTOP" ]] && alias selfie="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"

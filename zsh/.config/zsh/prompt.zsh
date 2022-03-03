# original by pyratebeard; modified by conorhk
ico_ahead="▲ "
ico_behind="▼ "
ico_diverged="↕ "
color_root="%F{red}"
color_user="%F{3}"
color_normal="%F{white}"
color_git="%F{13}"

# allow functions in the prompt
setopt PROMPT_SUBST
autoload -Uz colors && colors

# colors for permissions
if [[ "$EUID" -ne "0" ]]
then
	color_prompt="${color_user}"
else
	color_prompt="${color_root}"
fi

git_prompt() {
  repo=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  if [[ ! "$repo" || "$repo" = false ]]; then
    return
  fi

  bare_repo=$(git rev-parse --is-bare-repository 2> /dev/null)
  if [ "$bare_repo" = true ]; then
    return
  fi

  ref="$(git name-rev --name-only HEAD | sed 's!remotes/!!' 2> /dev/null)"
  if [[ "${ref}" == "tags"* ]] ; then
    branch="$(git branch | grep "^*" | tr -d "*")"
    ref="${branch/ /} ${ref}"
  fi

  if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
    color_git="%F{red}"
  fi

  stat=$(git status | sed -n 2p)
  case "$stat" in
    *ahead*)
      stat="$ico_ahead"
    ;;
    *behind*)
      stat="$ico_behind"
    ;;
    *diverged*)
      stat="$ico_diverged"
    ;;
    *)
      stat=""
    ;;
  esac
  echo " on %B"${color_git}${ref} ${stat}"%b"
}
PROMPT='%F{15}%B%(5~|%-1|%3~|%4~)%b$(git_prompt)${color_prompt}──── ─${color_normal} '

#!/bin/bash
# zlogin is sourced in login shell sessions
# load order 4
# shellcheck disable=SC2148

[[ -f /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh ]] && source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
[[ -f ${HOME}/.fzf.zsh ]] && source ${HOME}/.fzf.zsh

[[ ${commands[direnv]} ]] && source <(direnv hook zsh)
[[ ${commands[eksctl]} ]] && source <(eksctl completion zsh)
[[ ${commands[gh]} ]] && source <(gh completion -s zsh)
[[ ${commands[helm]} ]] && source <(helm completion zsh)
[[ ${commands[kubectl]} ]] && source <(kubectl completion zsh)
[[ ${commands[starship]} ]] && source <(starship init zsh)

for folder in secrets.d init.d; do
  for filename in "$HOME/.$folder"/*; do
    source "$filename"
  done
done

[[ ${commands[exa]} ]] && alias ll='exa --long --sort=modified --group-directories-first --time-style=long-iso --icons --grid --git'

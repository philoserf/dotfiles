#!/bin/bash
# zlogin is sourced in login shell sessions
# load order 4
# shellcheck disable=SC2148

[[ ${commands[starship]} ]] && source <(starship init zsh)

[[ ${commands[direnv]} ]] && source <(direnv hook zsh)
[[ ${commands[pyenv]} ]] && source <(pyenv init -)
[[ ${commands[rbenv]} ]] && source <(rbenv init -)

[[ ${commands[kubectl]} ]] && source <(kubectl completion zsh)
[[ ${commands[helm]} ]] && source <(helm completion zsh)
[[ ${commands[eksctl]} ]] && source <(eksctl completion zsh)
[[ ${commands[flux]} ]] && source <(flux completion zsh)

[[ ${commands[flux]} ]] && source <(gh completion -s zsh)

for folder in secrets.d init.d; do
  for filename in "$HOME/.$folder"/*; do
    source "$filename"
  done
done

[[ ${commands[exa]} ]] && alias ll='exa --classify --long --header --git --sort=modified --group-directories-first --time-style=long-iso --icons'

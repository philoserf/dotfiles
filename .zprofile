#!/bin/bash
# zprofile is sourced in login shell sessions
# load order 2
# shellcheck disable=SC2148,SC1090,SC1091,SC2154

source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh

zgen oh-my-zsh plugins/kubectl
zgen oh-my-zsh plugins/helm
zgen oh-my-zsh plugins/rbenv
zgen oh-my-zsh plugins/direnv
zgen oh-my-zsh plugins/ripgrep
zgen oh-my-zsh plugins/ssh-agent
zgen oh-my-zsh plugins/zsh_reload

zgen loadall <<PLUGINS
  chrissicool/zsh-256color
  djui/alias-tips
  unixorn/autoupdate-zgen
  unixorn/fzf-zsh-plugin
  unixorn/git-extra-commands
  unixorn/kubectx-zshplugin
  zsh-users/zsh-apple-touchbar
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
PLUGINS

zgen save >/dev/null 2>&1

for folder in secrets.d init.d; do
  for filename in "$HOME/.$folder"/*; do
    source "$filename"
  done
done

[[ ${commands[starship]} ]] && source <(starship init zsh)

[[ ${commands[direnv]} ]] && source <(direnv hook zsh)
[[ ${commands[pyenv]} ]] && source <(pyenv init -)
[[ ${commands[rbenv]} ]] && source <(rbenv init -)

[[ ${commands[kubectl]} ]] && source <(kubectl completion zsh)
[[ ${commands[helm]} ]] && source <(helm completion zsh)
[[ ${commands[eksctl]} ]] && source <(eksctl completion zsh)
[[ ${commands[flux]} ]] && source <(flux completion zsh)

[[ ${commands[flux]} ]] && source <(gh completion -s zsh)

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -A'
alias l='ls -lh'

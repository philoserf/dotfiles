#!/bin/bash
# zprofile is sourced in login shell sessions
# load order 2
# shellcheck disable=SC2148,SC1090,SC1091,SC2154

source "${HOME}/.antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundles <<BUNDLES
  aws
  direnv
  helm
  history
  kubectl
  rbenv
  ripgrep
  ssh-agent
  zsh_reload

  chrissicool/zsh-256color
  djui/alias-tips
  unixorn/fzf-zsh-plugin
  unixorn/git-extra-commands
  zsh-users/zsh-apple-touchbar
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen theme denysdovhan/spaceship-prompt

antigen apply

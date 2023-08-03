#!/bin/bash
# zprofile is sourced in login shell sessions
# load order 2
# shellcheck disable=

source "${HOME}/.zgenom/zgenom.zsh"
zgenom autoupdate
ZGEN_RESET_ON_CHANGE="${ZDOTDIR}/.zprofile"

zgenom ohmyzsh
zgenom ohmyzsh plugins/history
zgenom ohmyzsh plugins/ripgrep
zgenom ohmyzsh plugins/ssh-agent
zgenom ohmyzsh themes/clean

zgenom loadall <<BUNDLES
  djui/alias-tips
  unixorn/fzf-zsh-plugin
  unixorn/git-extra-commands
  unixorn/jpb.zshplugin
  unixorn/tumult.plugin.zsh
  zsh-users/zsh-apple-touchbar
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

if ! zgenom saved; then
  zgenom save
fi

zgenom compile .zshrc
zgenom compile .zshenv
zgenom compile .zprofile
zgenom compile .zlogin
zgenom compile .zlogout
#!/bin/bash
# zprofile is sourced in login shell sessions
# load order 2
# shellcheck disable=SC2148,SC1090,SC1091,SC2154

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle kubectl
antigen bundle helm
antigen bundle rbenv
antigen bundle direnv
antigen bundle ripgrep
antigen bundle ssh-agent
antigen bundle zsh_reload

antigen bundle djui/alias-tips
antigen bundle nojhan/liquidprompt
antigen bundle zsh-users/zsh-apple-touchbar
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

for folder in secrets.d init.d; do
	for filename in "$HOME/.$folder"/*; do
		source "$filename"
	done
done

[[ ${commands[kubectl]} ]] && source <(kubectl completion zsh)
[[ ${commands[helm]} ]] && source <(helm completion zsh)
[[ ${commands[direnv]} ]] && source <(direnv hook zsh)
[[ ${commands[pyenv]} ]] && source <(pyenv init -)
[[ ${commands[rbenv]} ]] && source <(rbenv init -)

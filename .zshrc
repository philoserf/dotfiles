#!/bin/bash
# zshrc is sourced in interactive shell sessions
# load order 3
# shellcheck disable=SC2148,SC2034,SC1091

HISTFILE="$HOME/.histfile"
HISTCONTROL=ignorespace
HISTSIZE=10000
SAVEHIST=1000
setopt appendhistory extendedhistory histexpiredupsfirst histfindnodups histignorealldups histignoredups histignorespace histreduceblanks histsavenodups histverify incappendhistory sharehistory autocd nomatch
bindkey -e
autoload -Uz compinit && compinit -u
FPATH=/usr/local/share/zsh/site-functions:$FPATH
autoload -Uz bashcompinit && bashcompinit -u
FPATH=/usr/local/etc/bash_completion.d:$FPATH
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
typeset -U FPATH

export LANG=en_US.UTF-8
autoload run-help
ulimit -n 8192

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='code --wait --new-window'
fi

unalias run-help
autoload run-help
alias help=run-help
export PATH="/usr/local/opt/openjdk/bin:$PATH"

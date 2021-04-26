# load order 6 (interactive) after /etc/zshrc (exists)

HISTFILE=${HOME}/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

autoload -Uz compinit && compinit -u
FPATH=/usr/local/share/zsh/site-functions:$FPATH
autoload -Uz bashcompinit && bashcompinit -u
FPATH=/usr/local/etc/bash_completion.d:$FPATH

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code --wait --new-window'
fi

export BROWSER='links'

alias rm='rm -i'
alias mv='mv -i'

# load order 2 (all) after /etc/zshenv (none)

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

autoload -Uz compinit && compinit -u
FPATH=/usr/local/share/zsh/site-functions:$FPATH
autoload -Uz bashcompinit && bashcompinit -u
FPATH=/usr/local/etc/bash_completion.d:$FPATH

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -A'
alias l='ls -lh'

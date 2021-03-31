#!/bin/bash
# zshenv is sourced in all shell sessions
# load order 1
# shellcheck disable=SC2148,SC1090,SC2154

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"

if [[ ${SHLVL} == 1 ]]; then
  unset PATH
  PATH="${HOME}/bin:${HOME}/go/bin:/usr/local/bin:/usr/bin:/bin"
  PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
  PATH="${PATH}:${HOME}/.krew/bin"
  export PATH

  MANPATH="/usr/local/man:${MANPATH}"
  export MANPATH
fi

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

ssh-add ~/.ssh/id_rsa_mark_philoserf >/dev/null 2>&1

autoload -Uz compinit && compinit -u
FPATH=/usr/local/share/zsh/site-functions:$FPATH
autoload -Uz bashcompinit && bashcompinit -u
FPATH=/usr/local/etc/bash_completion.d:$FPATH

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

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -A'
alias l='ls -lh'
[[ ${commands[exa]} ]] && alias ll='exa --classify --long --accessed --header --git --git-ignore --all --sort=modified --group-directories-first --time-style=long-iso'

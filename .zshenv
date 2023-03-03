# load order 2 (all) after /etc/zshenv (none)

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

export XML_CATALOG_FILES="/usr/local/etc/xml/catalog"

if [[ ${SHLVL} == 1 ]]; then
  unset PATH
  PATH="${HOME}/bin:${HOME}/go/bin"
  PATH="${PATH}:/Library/TeX/texbin"
  PATH="${PATH}:/usr/local/MacGPG2/bin"
  PATH="${PATH}:/usr/local/opt/curl/bin"
  PATH="${PATH}:/usr/local/opt/icu4c/bin:/usr/local/opt/icu4c/sbin"
  PATH="${PATH}:/usr/local/opt/ncurses/bin"
  PATH="${PATH}:/usr/local/opt/node@10/bin"
  PATH="${PATH}:/usr/local/opt/openjdk/bin"
  PATH="${PATH}:/usr/local/opt/openldap/bin:/usr/local/opt/openldap/sbin"
  PATH="${PATH}:/usr/local/opt/openssl@1.1/bin"
  PATH="${PATH}:/usr/local/opt/python@3.9/libexec/bin"
  PATH="${PATH}:/usr/local/opt/readline/bin"
  PATH="${PATH}:/usr/local/opt/ruby/bin"
  PATH="${PATH}:/usr/local/opt/sqlite/bin"
  # PATH="${PATH}:"
  PATH="${PATH}:/usr/local/bin:/usr/bin:/bin"
  PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
  # PATH="${PATH}:/usr/local/opt/coreutils/libexec/gnubin"
  export PATH

  MANPATH="/usr/local/man:${MANPATH}"
  export MANPATH
fi

FPATH=/usr/local/share/zsh-completions:${FPATH}
FPATH=/usr/local/share/zsh/site-functions:${FPATH}
FPATH=/usr/local/etc/bash_completion.d:${FPATH}
autoload -Uz compinit && compinit -u
autoload -Uz bashcompinit && bashcompinit -u

alias rm='rm -i'
alias mv='mv -i'

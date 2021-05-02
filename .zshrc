#!/bin/bash
# zshrc is sourced in interactive shell sessions
# load order 3
# shellcheck disable=SC2148,SC2034,SC1091

HISTFILE="$HOME/.histfile"
HISTCONTROL=ignorespace
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory extendedhistory histexpiredupsfirst histfindnodups histignorealldups histignoredups histignorespace histreduceblanks \
  histsavenodups histverify incappendhistory sharehistory autocd nomatch
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

if type brew &>/dev/null; then
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/curl/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/icu4c/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libffi/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libxml2/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/mysql-client/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/ncurses/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/node@10/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openjdk/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openldap/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openssl@1.1/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/readline/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/ruby/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/tcl-tk/include"
  CPPFLAGS="${CPPFLAGS} "
  # CPPFLAGS="${CPPFLAGS} "
  export CPPFLAGS
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/bison/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/curl/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/icu4c/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/libffi/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/libxml2/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/mysql-client/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/ncurses/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/node@10/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/openldap/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/openssl@1.1/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/readline/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/ruby/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/tcl-tk/lib"
  # LDFLAGS="${LDFLAGS} "
  export LDFLAGS
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/curl/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/icu4c/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libxml2/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/mysql-client/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/ncurses/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/openssl@1.1/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/readline/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/ruby/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/sqlite/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/tcl-tk/lib/pkgconfig"
  # PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:"
  export PKG_CONFIG_PATH
  RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  export RUBY_CONFIGURE_OPTS
fi

# load order 6 (interactive) after /etc/zshrc (exists)

HISTFILE=${HOME}/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='codium --wait --new-window'
fi

export BROWSER='links'

if type brew &>/dev/null; then
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/curl/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/icu4c/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libffi/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libxml2/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/ncurses/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/node@10/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openjdk/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openldap/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/openssl@1.1/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/readline/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/ruby/include"
  CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/sqlite/include"
  # CPPFLAGS="${CPPFLAGS} "
  export CPPFLAGS
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/curl/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/icu4c/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/libffi/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/libxml2/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/ncurses/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/node@10/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/openldap/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/openssl@1.1/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/readline/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/ruby/lib"
  LDFLAGS="${LDFLAGS} -L/usr/local/opt/sqlite/lib"
  # LDFLAGS="${LDFLAGS} "
  export LDFLAGS
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/curl/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/icu4c/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libffi/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/libxml2/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/ncurses/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/openssl@1.1/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/readline/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/ruby/lib/pkgconfig"
  PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:/usr/local/opt/sqlite/lib/pkgconfig"
  # PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:"
  export PKG_CONFIG_PATH
  RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  export RUBY_CONFIGURE_OPTS
fi

alias rm='rm -i'
alias mv='mv -i'

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
  # CPPFLAGS="${CPPFLAGS} "
  export CPPFLAGS
  # LDFLAGS="${LDFLAGS} "
  export LDFLAGS
  # PKG_CONFIG_PATH="${PKG_CONFIG_PATH}:"
  export PKG_CONFIG_PATH
  RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
  export RUBY_CONFIGURE_OPTS
fi

alias rm='rm -i'
alias mv='mv -i'

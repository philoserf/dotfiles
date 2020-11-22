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

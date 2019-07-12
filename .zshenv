#!/bin/bash
# zshenv is sourced in all shell sessions
# load order 1
# shellcheck disable=SC2148,SC1090,SC2154

if [[ $SHLVL == 1 ]]; then
	unset PATH
	PATH="$HOME/bin:$HOME/go/bin:/usr/local/bin:/usr/bin:/bin"
	PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
	export PATH

	MANPATH="/usr/local/man:$MANPATH"
	export MANPATH
fi

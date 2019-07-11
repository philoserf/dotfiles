#!/bin/bash
# zlogin is sourced in login shell sessions
# load order 4
# shellcheck disable=SC2148

if [ -f "$HOME/.todo" ]; then
	todo list | head 3 2>/dev/null
fi

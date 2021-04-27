# load order 2 (all) after /etc/zshenv (none)

export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_CACHE_HOME="${HOME}/.cache"
export ZDOTDIR=${XDG_CONFIG_HOME}/zsh

if [[ ${SHLVL} == 1 ]]; then
  unset PATH
  PATH="${HOME}/bin:${HOME}/go/bin"
  PATH="${PATH}:/usr/local/opt/ruby/bin"
  PATH="${PATH}:/usr/local/opt/python@3.9/libexec/bin"
  PATH="${PATH}:/Library/TeX/texbin"
  PATH="${PATH}:/usr/local/MacGPG2/bin"
  # PATH="${PATH}:
  PATH="${PATH}:/usr/local/bin:/usr/bin:/bin"
  PATH="${PATH}:/usr/local/sbin:/usr/sbin:/sbin"
  export PATH

  MANPATH="/usr/local/man:${MANPATH}"
  export MANPATH
fi

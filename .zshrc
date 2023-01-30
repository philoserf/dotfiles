export LANG=en_US.UTF-8
export HISTCONTROL=ignoredups
export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY

if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='code'
fi

if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
zcomet load MichaelAquilina/zsh-you-should-use
zcomet load unixorn/git-extra-commands
zcomet load unixorn/tumult.plugin.zsh
zcomet load zsh-users/zsh-completions
zcomet load zsh-users/zsh-history-substring-search
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load zsh-users/zsh-autosuggestions
zcomet compinit

source <(/opt/homebrew/bin/starship init zsh --print-full-init)

eval "$(/opt/homebrew/bin/brew shellenv)"

fpath=(/opt/homebrew/share/zsh/site-functions ${fpath})
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}

	autoload -Uz compinit
	compinit
fi

PATH="/opt/homebrew/opt/python@3.10/libexec/bin":${PATH}
PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
PATH="/opt//homebrew/lib/ruby/gems/3.2.0/bin/:${PATH}"
PATH="${HOME}/go/bin:${PATH}"
PATH="${HOME}/bin:${PATH}"


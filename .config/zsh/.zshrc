# load order 6 after /etc/zshrc and before /etc/zlogin

export ZSHRC_LOADED=1

# initialize zcomet package manager
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
	command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

# shell history configuration
export HISTFILE=~/.config/zsh/zsh_history
export HISTSIZE=1200        # number of commands to remember
export SAVEHIST=1000        # number of commands to save to disk
setopt APPEND_HISTORY       # append to history file
setopt SHARE_HISTORY        # share history between terminals
setopt HIST_REDUCE_BLANKS   # remove superfluous blanks
setopt HIST_IGNORE_SPACE    # leading space hides commands from history
setopt HIST_IGNORE_ALL_DUPS # ignore duplicated commands
setopt HIST_FIND_NO_DUPS    # don't record an event that was just recorded again
setopt HIST_SAVE_NO_DUPS    # don't write duplicate entries to the history file
alias history='fc -l 1'     # list all history with line numbers
zcomet load marlonrichert/zsh-hist

# delete-failed-history() {
#   (( ? ))
#     hist -s d -1
# }
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd delete-failed-history

# set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# set editor
export EDITOR='vim'
export VISUAL='code --wait --new-window'

zcomet load MichaelAquilina/zsh-you-should-use # suggest better alternatives to common commands

zcomet load unixorn/git-extra-commands # add some useful git aliases
zcomet load unixorn/tumult.plugin.zsh  # add some useful aliases

zcomet load zsh-users/zsh-completions              # additional completions from the community
zcomet load zsh-users/zsh-syntax-highlighting      # syntax highlighting for the shell
zcomet load zsh-users/zsh-autosuggestions          # suggest commands as you type
zcomet load zsh-users/zsh-history-substring-search # search through history with up/down arrows
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# set prompt
source <(/opt/homebrew/bin/starship init zsh --print-full-init)

# initialize brew TODO(mark): add check for brew and install if absent
eval "$(/opt/homebrew/bin/brew shellenv)"

# initialize function path
fpath=(/opt/homebrew/share/zsh/site-functions ${fpath})
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:${FPATH}
	autoload -Uz compinit
	compinit
fi

# initialize homebrew installed tools paths
PATH="/opt/homebrew/opt/python/libexec/bin":${PATH}
PATH="/opt/homebrew/opt/ruby/bin:${PATH}"
PATH="/opt/homebrew/lib/ruby/gems/3.2.0/bin/:${PATH}"

# initialize my paths
PATH="${HOME}/go/bin:${PATH}"
PATH="${HOME}/bin:${PATH}"

zcomet compinit # initialize completion

# aliases
alias ..='cd ..'
alias ls='exa --sort=modified --reverse --classify --group-directories-first --icons --color=always'
alias ll='ls --long'
alias la='ls --all'
alias lla='ll --all'
alias l='ls'
alias grep='grep --color=auto'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias p='ps -ef'
alias env='env | sort'
alias g='git'
alias t='terraform'
alias k='kubectl'
alias kx='kubectx'
alias kn='kubens'

# functions

# open explainshell with command
function es() {
	open "https://explainshell.com/explain?cmd=$*"
}

# aggressively deep clean git repo
function gdc() {
	set -o xtrace
	git count-objects --verbose --human-readable
	git reflog expire --expire=now --all
	git repack -adf --depth=250 --window=250
	git gc --aggressive --prune=now --force
	git gc
	git gc --aggressive
	git repack -Ad
	git prune
	git count-objects --verbose --human-readable
}

# Enable comments when working in an interactive shell.
setopt interactive_comments

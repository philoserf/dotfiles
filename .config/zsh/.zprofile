# load order 4 (login) after /etc/zprofile (exists)

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<BUNDLES
  history
  ripgrep
  ssh-agent
  zsh_reload
  chrissicool/zsh-256color
  djui/alias-tips
  unixorn/fzf-zsh-plugin
  zsh-users/zsh-apple-touchbar
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-syntax-highlighting
BUNDLES

antigen theme denysdovhan/spaceship-prompt

antigen apply

alias ll='exa --long --grid --icons --sort accessed --group-directories-first --git'
alias lla='ll --all'

# shellcheck disable=SC2148,SC2164

alias be='bundle exec'
alias git='hub'
alias k='kubectl'
alias kctx='kubectx'
alias kns='kubens'
alias ll="ls -FrtohpqGl"
alias lla='ll -A'
alias update='tusk -f $HOME/updates.yml'

pushd() { builtin pushd "$@" >/dev/null; }
popd() { builtin popd "$@" >/dev/null; }

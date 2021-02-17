# shellcheck disable=SC2148,SC2164

alias k='kubectl'
alias kctx='kubectx'
alias kge='kubectl get events'
alias kgea='kubectl get events --all-namespaces'
alias kgeaw='kubectl get events --all-namespaces --watch'
alias kgew='kubectl get events --watch'
alias kns='kubens'
alias ll="ls -FrtohpqGl"
alias lla='ll -A'
alias update='task --taskfile ${HOME}/Taskfile.yml'
popd() { builtin popd "$@" >/dev/null; }
pushd() { builtin pushd "$@" >/dev/null; }

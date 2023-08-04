# shellcheck disable=SC2148,SC2164

# established aliases and short functions
alias k='kubectl'
alias kd='k describe'
alias ke='k edit'
alias kg='k get'
alias kge='k get events'
alias kgea='k get events --all-namespaces'
alias kgeaw='k get events --all-namespaces --watch'
alias kgew='k get events --watch'

alias kctx='kubectx'
alias kns='kubens'

alias update='task --taskfile ${HOME}/Taskfile.yml'

popd() { builtin popd "$@" >/dev/null; }
pushd() { builtin pushd "$@" >/dev/null; }

# trial aliases or short functions
alias ez='pushd ${HOME};code $(yadm ls-files|grep -e "^\.z");popd'

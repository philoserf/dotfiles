# load order 4 after /etc/zprofile and before /etc/zshrc

[[ -d ./secrets ]] && source ./secrets/*.zsh
[[ -d ./include ]] && source ./include/*.zsh

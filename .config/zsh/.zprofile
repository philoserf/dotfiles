# load order 4 after /etc/zprofile and before /etc/zshrc

[[ -d ${HOME}/.config/zsh/secrets ]] && source ${HOME}/.config/zsh/secrets/*.zsh
[[ -d ${HOME}/.config/zsh/include ]] && source ./include/*.zsh

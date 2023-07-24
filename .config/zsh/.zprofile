# load order 4 after /etc/zprofile and before /etc/zshrc

[[ -d ./secrets ]] && source ./secrets/*.sh

export ZPROFILE_LOADED=1

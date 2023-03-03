# shellcheck disable=SC2148

new-mac-address() {
	printf "starting mac addr: %s\n" "$(ifconfig en0 | grep ether)"
	ifconfig en0 ether "$(openssl rand -hex 6 | sed "s/\(..\)/\1:/g; s/./0/2; s/.$//")"
	printf "new mac addr: %s\n" "$(ifconfig en0 | grep ether)"
}

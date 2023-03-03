# shellcheck disable=SC2148

clear-dns() {
	sudo dscacheutil -flushcache
	sudo killall -HUP mDNSResponder
}

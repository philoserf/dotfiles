# shellcheck disable=SC2148

klogin() {
	kubelogin login nonprod hydrogen
	kubelogin login prod barcelona
	# kubelogin login prod steel ==> login to one aws production cluster
}

# shellcheck disable=SC2148

klogin() {
	kubelogin login nonprod hydrogen
	kubelogin login prod steel
	kubelogin login prod barcelona
}

# shellcheck disable=SC2148

rubocop-ready() {
  touch .rubocop.yml
  rubocop --auto-correct
  rubocop --auto-gen-config
}

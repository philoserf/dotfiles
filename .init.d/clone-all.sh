# shellcheck disable=SC2148

clone-all() {
	collection="$1"
	pages="$2"
	target="$3"

	[[ -z $collection ]] && collection="repos"
	[[ -z $pages ]] && pages=1
	[[ -z $target ]] && target="philoserf"

	counter=0
	while [[ $counter -ne $pages ]]; do
		counter=$((counter + 1))
		curl -sLknu "philoserf:$GITHUB_TOKEN" "https://api.github.com/users/$target/$collection?per_page=100&page=$counter" |
			jq -r '.[].ssh_url' |
			xargs -L1 git clone
	done
}

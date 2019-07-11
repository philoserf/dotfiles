# shellcheck disable=SC2148

list-k8s-resources() {
	without_namespace
	with_namespace
}

without_namespace() {
	printf "\n\nGlobal\n======"
	resource_count=$(("$(kubectl api-resources --namespaced=false | wc -l)" - 1))
	resources=$(kubectl api-resources --namespaced=false | tail -n $resource_count | awk '{print $1}')
	for resource in $resources; do
		printf "\n\nChecking %s...\n" "$resource"
		kubectl get "$resource"
	done
}

with_namespace() {
	printf "\n\nNamespaced\n=========="
	resource_count=$(("$(kubectl api-resources --namespaced | wc -l)" - 1))
	resources=$(kubectl api-resources --namespaced | tail -n $resource_count | awk '{print $1}')
	for resource in $resources; do
		printf "\n\nChecking %s...\n" "$resource"
		kubectl get "$resource" --all-namespaces
	done
}

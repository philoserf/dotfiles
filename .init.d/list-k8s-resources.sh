# shellcheck disable=SC2148

list-k8s-resources() {
  without_namespace
  with_namespace
}

without_namespace() {
  printf "\n\nGlobal\n======"
  resource_count=$(($(kubectl api-resources --namespaced=false | wc -l) - 1))
  for resource in $(kubectl api-resources --namespaced=false | awk '{print $1}' | tail -n $resource_count | sort -u); do
    printf "\n\nChecking %s...\n" "$resource"
    kubectl get "$resource"
  done
}

with_namespace() {
  printf "\n\nNamespaced\n=========="
  resource_count=$(($(kubectl api-resources --namespaced | wc -l) - 1))
  for resource in $(kubectl api-resources --namespaced | awk '{print $1}' | tail -n $resource_count | sort -u); do
    [[ $resource == "events" ]] && continue
    printf "\n\nChecking %s...\n" "$resource"
    kubectl get "$resource" --all-namespaces
  done
}

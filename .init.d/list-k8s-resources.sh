# shellcheck disable=SC2148,SC2086

list_k8s_resources() {
  get_resources false # global
  get_resources true  # namespaced
}

get_resources() {
  if [ $1 ]; then
    echo "global"
    all=
  else
    echo "namespaced"
    all="--all"
  fi

  for resource in $(kubectl api-resources --verbs=list --output=name --namespaced=$1); do
    printf "\n\nChecking %s...\n" ${resource}
    kubectl get --show-kind --ignore-not-found ${all} ${resource}
  done
}

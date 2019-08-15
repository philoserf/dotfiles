# shellcheck disable=SC2148

klogin() {
  kubelogin login nonprod hydrogen
  kubelogin login prod barcelona
  # kubelogin login prod steel ==> login to one aws production cluster

  gcloud container clusters get-credentials cluster-1 \
    --project jwn-k8s-nonprod-t2fv --region us-west1
  gcloud container clusters get-credentials cluster-1 \
    --project jwn-k8s-prod-oohy --region us-west1
  gcloud container clusters get-credentials cluster-3 \
    --project jwn-k8s-prod-oohy --region us-central1

  kubectl config delete-context helium
  kubectl config delete-context madrid
  kubectl config delete-context bronze

  kubectl config rename-context gke_jwn-k8s-nonprod-t2fv_us-west1_cluster-1 helium
  kubectl config rename-context gke_jwn-k8s-prod-oohy_us-west1_cluster-1 madrid
  kubectl config rename-context gke_jwn-k8s-prod-oohy_us-central1_cluster-3 bronze
}

resource "digitalocean_kubernetes_cluster" "k8s1" {
  name   = "k8s1"
  region = "lon1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.30.4-do.0"

  node_pool {
    name       = "worker-pool"
    size       = "s-2vcpu-4gb-intel"
    node_count = 3

  }
}

resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name   = "example-k8s-cluster"
  region = "lon1"
  version = "1.30.4-do.0"  # Replace with a valid version

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}


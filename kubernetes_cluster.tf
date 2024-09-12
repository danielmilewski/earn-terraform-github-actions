resource "digitalocean_kubernetes_cluster" "k8s_cluster" {
  name   = "example-k8s-cluster"
  region = "lon1"
  version = "1.25.3-do.0"

  node_pool {
    name       = "default-pool"
    size       = "s-2vcpu-4gb"
    node_count = 3
  }
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.k8s_cluster.kube_config[0].raw_config
  sensitive = true
}


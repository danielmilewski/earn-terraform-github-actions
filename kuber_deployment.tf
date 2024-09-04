resource "kubernetes_deployment" "doctl_kubectl" {
  metadata {
    name = "doctl-kubectl"  # Updated to use hyphens instead of underscores
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "doctl-kubectl"  # Updated to use hyphens
      }
    }

    template {
      metadata {
        labels = {
          app = "doctl-kubectl"  # Updated to use hyphens
        }
      }

      spec {
        container {
          image = "registry.digitalocean.com/k8s1/doctl_kubectl:${var.docker_image_tag}"
          name  = "doctl-kubectl"  # Updated to use hyphens
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


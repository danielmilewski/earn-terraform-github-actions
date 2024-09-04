resource "kubernetes_deployment" "doctl_kubectl" {
  metadata {
    name = "doctl_kubectl"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "doctl_kubectl"
      }
    }

    template {
      metadata {
        labels = {
          app = "doctl_kubectl"
        }
      }

      spec {
        container {
          image = "registry.digitalocean.com/k8s1/doctl_kubectl:${var.docker_image_tag}"
          name  = "doctl_kubectl"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}


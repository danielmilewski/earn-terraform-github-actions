resource "kubernetes_deployment" "k8s1" {
  metadata {
    name = "k8s1"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "k8s1"
      }
    }

    template {
      metadata {
        labels = {
          app = "k8s1"
        }
      }

      spec {
        container {
          image = "registry.digitalocean.com/k8s1/k8s1:${var.docker_image_tag}"
          name  = "k8s1"
          ports {
            container_port = 80
          }
        }
      }
    }
  }
}



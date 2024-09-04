
terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.40.0"
    }
  }
}


terraform {
 backend "remote" {
  organization = "infra-test-90"
  workspaces {
  name = "learn-terraform-github-action"
  }
 }
}

variable "do_token" {
  sensitive = true
}

variable "docker_image_tag" {
  description = "Tag for the Docker image"
  type        = string
  default     = "latest"
}


# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.do_token
}

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



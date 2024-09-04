
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



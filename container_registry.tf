# Create a new container registry
resource "digitalocean_container_registry" "k8s1" {
  name                   = "k8s1"
  subscription_tier_slug = "starter"
}

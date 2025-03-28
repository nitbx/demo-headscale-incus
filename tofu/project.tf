resource "incus_project" "headscale" {
  name        = "demo-headscale"
  description = "Project - demo headscale"
  config = {
    "features.storage.volumes" = true
    "features.images"          = true
    "features.profiles"        = true
    "features.storage.buckets" = true
  }
}

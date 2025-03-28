resource "incus_instance" "headscale" {
  name      = "headscale-${count.index}"
  count     = 1
  image     = "images:debian/12/cloud"
  ephemeral = false
  profiles  = ["${incus_profile.headscale.name}"]
  project   = incus_project.headscale.name
  config = {
    "cloud-init.user-data" = file("${path.module}/cloud-init/user-data")
  }
  device {
    type = "disk"
    name = "root"
    properties = {
      pool = "pool"
      path = "/"
    }
  }
}
resource "incus_instance" "exit-node-zones" {
  name      = "exit-node-zone-${count.index}"
  count     = var.how_many
  image     = "images:debian/12/cloud"
  ephemeral = false
  profiles  = ["${incus_profile.zones.name}"]
  project   = incus_project.headscale.name
  config = {
    "cloud-init.user-data" = file("${path.module}/cloud-init/user-data")
  }
  device {
    type = "disk"
    name = "root"
    properties = {
      pool = "pool"
      path = "/"
    }
  }
}
resource "incus_instance" "exit-node-clients" {
  name      = "exit-node-client-${count.index}"
  count     = var.how_many
  image     = "images:debian/12/cloud"
  ephemeral = false
  profiles  = ["${incus_profile.clients.name}"]
  project   = incus_project.headscale.name
  config = {
    "cloud-init.user-data" = file("${path.module}/cloud-init/user-data")
  }
  device {
    type = "disk"
    name = "root"
    properties = {
      pool = "pool"
      path = "/"
    }
  }
}

module "ansible_inventory" {
  source = "./modules/ansible_inventory"

  headscale_names         = [for h in incus_instance.headscale : h.name]
  exit_node_zones_names   = [for z in incus_instance.exit-node-zones : z.name]
  exit_node_clients_names = [for c in incus_instance.exit-node-clients : c.name]
}

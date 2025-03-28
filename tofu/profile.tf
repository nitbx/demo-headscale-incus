resource "incus_profile" "headscale" {
  name    = "headscale"
  project = incus_project.headscale.name

  device {
    name = "eth0"
    type = "nic"

    properties = {
      nictype = "bridged"
      network = "${incus_network.headscale.name}"
    }
  }
}
resource "incus_profile" "zones" {
  name    = "zones"
  project = incus_project.headscale.name

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype = "bridged"
      network = "${incus_network.zones.name}"
    }
  }
}
resource "incus_profile" "clients" {
  name    = "clients"
  project = incus_project.headscale.name

  device {
    name = "eth0"
    type = "nic"
    properties = {
      nictype = "bridged"
      network = "${incus_network.clients.name}"
    }
  }
}

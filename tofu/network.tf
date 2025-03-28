resource "incus_network" "headscale" {
  name    = "ovn-headscale-demo"
  type    = "ovn"
  project = incus_project.headscale.name

  config = {
    "network"                              = "UPLINK200",
    "security.acls.default.egress.action"  = "allow",
    "security.acls.default.ingress.action" = "allow"
  }
}
resource "incus_network" "zones" {
  name    = "ovn-headscale-demo-zones"
  type    = "ovn"
  project = incus_project.headscale.name

  config = {
    "network"                              = "UPLINK100",
    "security.acls.default.egress.action"  = "allow",
    "security.acls.default.ingress.action" = "allow"
  }
}
resource "incus_network" "clients" {
  name    = "ovn-headscale-demo-clients"
  type    = "ovn"
  project = incus_project.headscale.name

  config = {
    "network"                              = "UPLINK200",
    "security.acls.default.egress.action"  = "allow",
    "security.acls.default.ingress.action" = "allow"
  }
}

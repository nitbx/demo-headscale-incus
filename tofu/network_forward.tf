resource "incus_network_forward" "this" {
  network        = incus_network.headscale.name
  listen_address = "172.16.1.250"

  config = {
    target_address = cidrhost("${incus_instance.headscale[0].ipv4_address}/24", 200)
  }

  ports = [
    {
      description    = "stun - ${incus_instance.headscale[0].name}"
      protocol       = "tcp"
      listen_port    = "3478"
      target_port    = "3478"
      target_address = incus_instance.headscale[0].ipv4_address
    },
    {
      description    = "http ${incus_instance.headscale[0].name}"
      protocol       = "tcp"
      listen_port    = "443"
      target_port    = "443"
      target_address = incus_instance.headscale[0].ipv4_address
    },
    {
      description    = "https ${incus_instance.headscale[0].name}"
      protocol       = "tcp"
      listen_port    = "80"
      target_port    = "80"
      target_address = incus_instance.headscale[0].ipv4_address
    },
    {
      description    = "http-grpc - ${incus_instance.headscale[0].name}"
      protocol       = "tcp"
      listen_port    = "50443"
      target_port    = "50443"
      target_address = incus_instance.headscale[0].ipv4_address
    }
  ]
}

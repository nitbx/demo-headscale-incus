resource "local_file" "ansible_inventory" {
  filename = var.inventory_filename

  content  = <<-EOF
exit-node-clients:
  hosts:
%{ for client_name in var.exit_node_clients_names ~}
    ${client_name}:
%{ endfor }

exit-node-zones:
  hosts:
%{ for zone_name in var.exit_node_zones_names ~}
    ${zone_name}:
%{ endfor }

exit-nodes:
  children:
    exit-node-clients:
    exit-node-zones:

headscale:
  hosts:
%{ for hs_name in var.headscale_names ~}
    ${hs_name}:
%{ endfor }

all:
  children:
    exit-nodes:
    exit-node-clients:
    exit-node-zones:
    headscale:
EOF
}

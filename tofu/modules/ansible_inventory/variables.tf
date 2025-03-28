variable "headscale_names" {
  type    = list(string)
  default = []
  description = "List of headscale instance names."
}

variable "exit_node_zones_names" {
  type    = list(string)
  default = []
  description = "List of exit-node-zone instance names."
}

variable "exit_node_clients_names" {
  type    = list(string)
  default = []
  description = "List of exit-node-client instance names."
}

variable "inventory_filename" {
  type        = string
  default     = "../ansible/inventory/all.yaml"
  description = "Destination filename for the generated inventory."
}

variable outofscope_autoscaling {}
variable outofscope_min_node_count {}
variable outofscope_max_node_count {}
variable outofscope_node_count {}
variable outofscope_machine_type {}

variable inscope_autoscaling {}
variable inscope_min_node_count {}
variable inscope_max_node_count {}
variable inscope_node_count {}
variable inscope_machine_type {}

variable outofscope_alertmanager_autoscaling {}
variable outofscope_alertmanager_min_node_count {}
variable outofscope_alertmanager_max_node_count {}
variable outofscope_alertmanager_node_count {}
variable outofscope_alertmanager_machine_type {}

variable enable_shielded_nodes {
  default = false
  type    = bool
}
variable audit-logs-retention {
  default = "300"
}
variable app-logs-retention {
  default = "300"
}
variable fw_logging {}

variable subnet_cidr {
  default = "10.0.64.0/18"
  type    = string
}
variable security_policy_action {
  default = "allow"
}
variable security_policy_priority {
  default = "10000"
}
variable misc_subnet_cidr {
  default = "10.0.32.0/19"
}
variable services {
  type    = list
  default = [""]
}
variable security_policy_src_ip_ranges {
  default = ["167.98.129.192/29", "35.246.117.174/32", "35.246.59.160/32", "35.246.110.151/32"]
}
variable services_subnet_cidr {
  default = "10.0.0.0/19"
}
variable pods_subnet_cidr {
  default = "10.0.128.0/17"
}
variable environment {
  default = "dev"
  type    = string
}

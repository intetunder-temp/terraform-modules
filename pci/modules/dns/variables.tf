variable "environment" {
  description = "Enviorment name eg, dev, stg, prod"
}
variable project {
  description = "What region do you want to place your cloudrouter and nat in, INFO: please make sure you change the zones in 'distribution_policy_zones' if changing this value"
  default     = ""
  type        = string
}
variable collector_ip {
  description = "The Collectoprs public IP address, is assigned to the Loadbalancer"
}
variable deleter_ip {
  description = "The Deleters public IP address, is assigned to the Loadbalancer"
}
variable viewer_ip {
  description = "The Viewers public IP address, is assigned to the Loadbalancer"
}
variable proxy_ip {
  description = "The Proxys public IP address, is assigned to the Loadbalancer"
}
variable grafana_ip {
  description = "Grafana's public IP address, is assigned to the Loadbalancer"
}

variable eager_beaver_ip {
  description = "The eager-beaver public IP address, is assigned to the Loadbalancer"
}
variable lumberjack_ip {
  description = "The lumberjack public IP address, is assigned to the Loadbalancer"
}

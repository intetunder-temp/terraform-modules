variable "src_ip_ranges" {
  description = "What IP CIDR's should be whitelisted in CloudArmor"
}
variable "action" {
  description = "What action should the rule do, default to allow"
  default     = "allow"
}
variable "priority" {
  description = "What priority to give the cloudarmor rule, defaults to 10000"
  default     = "10000"
}
variable "description" {
  default = "Terraform Managed - adding inbound cloudarmor access"
}
variable "project" {
  description = "What Project to place CloudArmor in"
  default     = "lvh-dev"
}


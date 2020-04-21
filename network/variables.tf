variable "network_name" {
  type = "string"
}
variable "network_project" {}
variable "auto_create_subnetworks" {
  default = "false"
}
variable "description" {}
variable "routing_mode" {
  default = "GLOBAL"
}

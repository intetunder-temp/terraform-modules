variable labels {}
variable "project_id" {
  description = "The GCP project you want to enable APIs on"
  type        = string
}

variable "project_name" {
  type = string
}

variable "owner_access" {
  type = string
}

variable "auto_create_network" {
  type    = bool
  default = false
}

variable "billing_account" {
  type    = string
  default = "0191B0-82ED5F-1ABE8F"
}
variable "org_id" {
  type    = string
  default = "173736554255"
}


variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
}

variable "disable_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = false
  type        = string
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = false
  type        = string
}




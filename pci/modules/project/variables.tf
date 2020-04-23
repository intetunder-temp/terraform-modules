variable "project_id" {
  description = "The GCP project ID, this is the short name off the project and should not contain any spaces"
  default     = "lvhpay"
  type        = string
}
variable "team_name" {
  description = "What team is the owner of the project, this is for billing purposes"
  type        = string
  default     = "devops"
}

variable "project_name" {
  description = "Project Display Name"
  type        = string
  default     = "LvhPay"
}

variable "owner_access" {
  description = "Who should have owner access to the project, for PCI Compliant enviorments this should not be changed and cloudbuild (terraform) should be the project owner for all projects"
  type        = string
  default     = "serviceAccount:680248150950@cloudbuild.gserviceaccount.com"
}

variable "auto_create_network" {
  description = "Should we automatically create network on project creation"
  type        = bool
  default     = true
}

variable "billing_account" {
  description = "Billing number off lvhpay"
  type        = string
  default     = "010B59-146AFD-9C6427"
}
variable "org_id" {
  description = "ORG number off lvhpay"
  type        = string
  default     = "1040268195710"
}
variable "audit_log_config" {
  description = "DO NOT change, as this is needed for PCI complicance"
  default     = ["DATA_READ", "DATA_WRITE", "ADMIN_READ"]
}
variable "activate_apis" {
  description = "The list of apis to activate within the project"
  type        = list(string)
  default     = ["cloudbilling.googleapis.com", "container.googleapis.com", "compute.googleapis.com", "storage-api.googleapis.com", "iap.googleapis.com", "oslogin.googleapis.com", "dns.googleapis.com", "stackdriver.googleapis.com", "cloudtrace.googleapis.com", "cloudkms.googleapis.com", "binaryauthorization.googleapis.com", "servicenetworking.googleapis.com", "sql-component.googleapis.com"]
}

variable "disable_on_destroy" {
  description = "Whether project services will be disabled when the resources are destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_on_destroy"
  default     = "true"
  type        = string
}

variable "disable_dependent_services" {
  description = "Whether services that are enabled and which depend on this service should also be disabled when this service is destroyed. https://www.terraform.io/docs/providers/google/r/google_project_service.html#disable_dependent_services"
  default     = "true"
  type        = string
}


variable environment {
  description = "Enviorment name eg, dev, stg, prod"
  type        = string
  default     = "dev"
}

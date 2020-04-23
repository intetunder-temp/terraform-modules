variable "environment" {
  description = "Enviorment name eg, dev, stg, prod"
}
variable "activate_apis" {
  default     = ["cloudbilling.googleapis.com", "cloudkms.googleapis.com", "storage-component.googleapis.com"]
  description = "What services do you want to enable"
}
variable "location" {
  default     = "europe-west2"
  description = "What Location do you want to place your resources in"
}
variable project {
  default     = ""
  type        = string
  description = "What project do you want to place your resources in"
}
variable audit_bucket {
  description = "What bucket to place the Audit logs in"
}
variable "audit_log_config" {
  default     = ["DATA_READ", "DATA_WRITE", "ADMIN_READ"]
  description = "Do not change, this is variable is to ensure that we default to all the audit logs"
}


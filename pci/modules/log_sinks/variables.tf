variable "environment" {
  description = "Enviorment name eg, dev, stg, prod"
}
variable "activate_apis" {
  description = "What API's is needed for the logsink project"
  default     = ["cloudbilling.googleapis.com", "stackdriver.googleapis.com"]
}
variable "location" {
  description = "What location to place the log_sinks in"
  default     = "europe-west2"
}
variable project {
  description = "What Project to place the log_sinks in"
  default     = ""
  type        = string
}

variable "audit-logs-retention" {
  description = "Retention in seconds for the audit bucket"
}
variable "app-logs-retention" {
  description = "Retention in seconds for the app bucket"
}
variable "audit_log_config" {
  description = "DO NOT change, as this is needed for PCI complicance"
  default     = ["DATA_READ", "DATA_WRITE", "ADMIN_READ"]
}


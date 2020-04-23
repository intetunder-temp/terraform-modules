variable "project" {
  description = "Project to add the IAM policies/bindings"
  default     = ""
  type        = string
}

variable "service_accounts" {
  description = "Service Accounts list to add the IAM policies/bindings"
  default     = []
  type        = list(string)
}

variable "service_accounts_num" {
  description = "Number of Service Accounts, in case using dependencies of other resources' outputs"
  default     = 0
  type        = number
}

variable "mode" {
  description = "Mode for adding the IAM policies/bindings, additive and authoritative"
  default     = "additive"
}

variable "bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
}

variable "bindings_num" {
  description = "Number of bindings, in case using dependencies of other resources' outputs"
  default     = 0
  type        = number
}

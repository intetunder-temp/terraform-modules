variable "storage_buckets" {
  description = "Storage Buckets list to add the IAM policies/bindings"
  default     = []
  type        = list(string)
}

variable "storage_buckets_num" {
  description = "Number of Storage Buckets, in case using dependencies of other resources' outputs"
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

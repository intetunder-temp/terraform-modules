variable "bindings" {
  description = "Map of role (key) and list of members (value) to add the IAM policies/bindings"
  type        = map(list(string))
}

variable "bindings_num" {
  description = "Number of bindings, in case using dependencies of other resources' outputs"
  type        = number
}

variable "mode" {
  description = "Mode for adding the IAM policies/bindings, additive and authoritative"
  default     = "additive"
}

variable "entities" {
  description = "Entities list to add the IAM policies/bindings"
  type        = list(string)
}

variable "entities_num" {
  description = "Number of entities, in case using dependencies of other resources' outputs"
  type        = number
}

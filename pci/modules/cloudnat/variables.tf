variable network {
  description = "what network to put the cloudrouter and cloud nat in"
}
variable region {
  description = "What region do you want to place your cloudrouter and nat in, INFO: please make sure you change the zones in 'distribution_policy_zones' if changing this value"
}
variable project {
  description = "What project to place the cloudrouter and cloud nat in"
}
variable project_number {
  description = "Project number of the project you wanna place cloudrouter and cloud nat in"
}
variable distribution_policy_zones {
  description = "What zones should be getting a reserved public IP and what zones the cloudnat should be present in"
  default     = ["europe-west2-a", "europe-west2-b", "europe-west2-c"]
}

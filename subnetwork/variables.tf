variable name {}
variable project {}
variable description {}
variable subnet_cidr {}
variable region {}
variable network {}
variable private_ip_google_access {}
variable flow_logs {
  default = "false"
}

variable secondary_ip_range {}
variable aggregation_interval {
  default = "INTERVAL_10_MIN"
}
variable flow_sampling {
  default = 0.5
}
variable metadata {
  default = "INCLUDE_ALL_METADATA"
}

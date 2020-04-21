
resource google_compute_subnetwork subnetwork {
  name                     = var.name
  project                  = var.project
  description              = var.description
  ip_cidr_range            = var.subnet_cidr
  region                   = var.region
  network                  = var.network
  private_ip_google_access = var.private_ip_google_access

  dynamic log_config {
    for_each = var.flow_logs != "false" ? [var.flow_logs] : []
    content {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }


  dynamic secondary_ip_range {
    for_each = var.secondary_ip_range[var.name]
    content {
      ip_cidr_range = secondary_ip_range.value.ip_cidr_range
      range_name    = secondary_ip_range.value.range_name
    }
  }
}

resource "google_compute_security_policy" "policy" {
  name    = "internal"
  project = var.project

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Deny access to IPs in *"
  }

  rule {
    action   = var.action
    priority = var.priority
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = var.src_ip_ranges
      }
    }
    description = var.description
  }
}

resource "google_compute_security_policy" "global_allow" {
  name    = "external"
  project = var.project

  rule {
    action   = "allow"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "Allow access to IPs in *"
  }
}


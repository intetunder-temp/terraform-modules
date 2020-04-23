resource "google_compute_router" "router" {
  name    = "cloud-router-${var.region}"
  project = var.project
  region  = var.region
  network = var.network
}

resource "google_compute_address" "address" {
  count   = length(var.distribution_policy_zones)
  name    = "nat-external-address-${var.distribution_policy_zones[count.index]}"
  project = var.project
  region  = var.region
}

resource "google_compute_router_nat" "advanced-nat" {
  name    = "nat-${var.region}"
  project = var.project
  router  = google_compute_router.router.name
  region  = var.region

  min_ports_per_vm                   = "64"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.address[*].self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    filter = "ERRORS_ONLY"
    enable = true
  }
}

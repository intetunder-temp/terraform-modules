data "google_compute_zones" "available" {
  region  = var.region
  project = var.project
}

resource "google_compute_router" "router" {
  name    = "cloud-router-${var.region}"
  project = var.project
  region  = var.region
  network = var.network
}

resource "google_compute_address" "address" {
  count   = length(data.google_compute_zones.available.names)
  name    = "nat-external-address-${data.google_compute_zones.available.names[count.index]}"
  project = var.project
  region  = var.region
}

resource "google_compute_router_nat" "advanced-nat" {
  name    = "nat-${var.region}"
  project = var.project
  router  = google_compute_router.router.name
  region  = var.region

  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.address[*].self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  log_config {
    filter = "ERRORS_ONLY"
    enable = true
  }
}

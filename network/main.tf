resource "google_compute_network" "network" {
  name                    = var.network_name
  project                 = var.network_project
  auto_create_subnetworks = var.auto_create_subnetworks
  description             = var.description
  routing_mode            = var.routing_mode
}

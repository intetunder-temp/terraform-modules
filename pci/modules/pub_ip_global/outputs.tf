output "google_compute_global_address" {
  value = google_compute_global_address.ip[*].address
}

/******************************************
  Subnetwork Outputs	
 *****************************************/
output "subnetwork_name" {
  value = google_compute_subnetwork.subnetwork.*.name
}
output "subnetwork_region" {
  value = google_compute_subnetwork.subnetwork.*.region
}
output "subnetwork_self_link" {
  value = google_compute_subnetwork.subnetwork.*.self_link
}


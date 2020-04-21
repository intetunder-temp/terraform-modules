/******************************************
  Network Outputs	
 *****************************************/
output "network_name" {
  value = google_compute_network.network.name
}
output "network_project" {
  value = google_compute_network.network.project
}
output "network_self_link" {
  value = google_compute_network.network.self_link
}
output "network_routing" {
  value = google_compute_network.network.routing_mode
}


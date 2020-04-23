/******************************************
  Cloudnat Outputs	
 *****************************************/
output "nat_ips" {
  value = google_compute_address.address[*].address
}


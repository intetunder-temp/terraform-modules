resource "google_compute_global_address" "ip" {
  count        = "${length(var.names)}"
  project      = "${var.project}"
  name         = "${element(var.names, count.index)}"
  address_type = "EXTERNAL"
}

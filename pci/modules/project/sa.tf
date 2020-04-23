resource "google_service_account" "ccg_collector" {
  project      = google_project.main.id
  account_id   = "tf-ccg-collector"
  display_name = "Terraform Managed SA Collector"
}

resource "google_service_account" "ccg_deleter" {
  project      = google_project.main.id
  account_id   = "tf-ccg-deleter"
  display_name = "Terraform Managed SA Deleter"
}

resource "google_service_account" "ccg_proxy" {
  project      = google_project.main.id
  account_id   = "tf-ccg-proxy"
  display_name = "Terraform Managed SA Proxy"
}

resource "google_service_account" "ccg_viewer" {
  project      = google_project.main.id
  account_id   = "tf-ccg-viewer"
  display_name = "Terraform Managed SA Viewer"
}

resource "google_service_account" "ccl_eager_beaver" {
  project      = google_project.main.id
  account_id   = "tf-ccl-eager-beaver"
  display_name = "Terraform Managed SA Eager Beaver"
}
resource "google_service_account" "ccl_lumberjack" {
  project      = google_project.main.id
  account_id   = "tf-ccl-lumberjack"
  display_name = "Terraform Managed SA Lumberjack"
}

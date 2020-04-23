resource "google_service_account" "node_pool_service_account" {
  project      = "${random_string.this.keepers.project}"
  account_id   = "${var.name}-${random_string.this.result}"
  display_name = var.name
}

resource "google_storage_bucket_iam_member" "member-eu" {
  bucket = "eu.artifacts.lvhpay-cicd.appspot.com"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.node_pool_service_account.email}"
}

resource "google_storage_bucket_iam_member" "member-usa" {
  bucket = "artifacts.lvhpay-cicd.appspot.com"
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.node_pool_service_account.email}"
}

resource "google_project_iam_member" "project-metric-writer" {
  project = "${random_string.this.keepers.project}"
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${google_service_account.node_pool_service_account.email}"
}

resource "google_project_iam_member" "project-logging-writer" {
  project = "${random_string.this.keepers.project}"
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${google_service_account.node_pool_service_account.email}"
}

output "service_account" {
  value = google_service_account.node_pool_service_account.email
}

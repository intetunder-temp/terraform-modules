resource "google_service_account" "node_pool_service_account" {
  project      = "${random_string.this.keepers.project}"
  account_id   = "${var.name}-${random_string.this.result}"
  display_name = var.name
}

resource "google_project_iam_member" "project-cloudsql" {
  project = "${random_string.this.keepers.project}"
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.node_pool_service_account.email}"
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
resource "google_project_iam_member" "project-trace-agent" {
  project = "${random_string.this.keepers.project}"
  role    = "roles/cloudtrace.agent"
  member  = "serviceAccount:${google_service_account.node_pool_service_account.email}"
}

output "service_account" {
  value = google_service_account.node_pool_service_account.email
}


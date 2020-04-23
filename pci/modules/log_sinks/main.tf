resource "random_string" "random-suffix" {
  length  = 6
  upper   = false
  number  = false
  special = false
}

resource "google_storage_bucket" "audit-logs" {
  name     = "${google_project.logs.project_id}-audit-logs"
  project  = google_project.logs.project_id
  location = var.location
  retention_policy {
    # PCI ref Retention of records and documentation for at least 12 months, covering all BAU activities
    retention_period = var.audit-logs-retention
    is_locked        = true
  }
}
resource "google_logging_project_sink" "audit-sink" {
  name                   = "audit-traffic-sink-${random_string.random-suffix.result}"
  project                = var.project
  destination            = "storage.googleapis.com/${google_storage_bucket.audit-logs.name}"
  filter                 = "-resource.type=k8s_container AND resource.labels.cluster_name=${var.project} AND -resource.labels.namespace_name=(credit-card-gateway OR credit-card-vault) AND -resource.labels.container_name=(credit-card-collector OR credit-card-viewer OR credit-card-deleter OR credit-card-proxy OR credit-card-vault)"
  unique_writer_identity = true
}

resource "google_project_iam_binding" "audit-log-writer" {
  role    = "roles/storage.objectCreator"
  project = google_project.logs.project_id
  members = [
    google_logging_project_sink.audit-sink.writer_identity,
    google_logging_project_sink.app-sink.writer_identity,
  ]
}

# Can't remove this due to 1 year retention_period in place
resource "google_storage_bucket" "app-logs" {
  name     = "${google_project.logs.project_id}-app-logs"
  project  = google_project.logs.project_id
  location = var.location
  retention_policy {
    # PCI ref Retention of records and documentation for at least 12 months, covering all BAU activities
    retention_period = var.app-logs-retention
    is_locked        = true
  }
}

resource "google_logging_project_sink" "app-sink" {
  name                   = "app-traffic-sink-${random_string.random-suffix.result}"
  project                = var.project
  destination            = "storage.googleapis.com/${google_storage_bucket.app-logs.name}"
  filter                 = "resource.type=k8s_container AND resource.labels.cluster_name=${var.project} AND resource.labels.namespace_name=(credit-card-gateway OR credit-card-vault) AND resource.labels.container_name=(credit-card-collector OR credit-card-viewer OR credit-card-deleter OR credit-card-proxy OR credit-card-vault)"
  unique_writer_identity = true
}


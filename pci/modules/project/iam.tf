resource "google_project_iam_member" "main" {
  project = google_project.main.id
  role    = "roles/owner"
  member  = var.owner_access
}

resource "google_project_iam_member" "iam-devops" {
  project = google_project.main.id
  role    = "roles/browser"
  member  = "group:devops@lvhpay.com"
}

resource "google_project_iam_audit_config" "project" {
  project = google_project.main.id
  service = "allServices"
  audit_log_config {
    log_type = "DATA_READ"
  }
  audit_log_config {
    log_type = "DATA_WRITE"
  }
  audit_log_config {
    log_type = "ADMIN_READ"
  }
}

resource "google_service_account_iam_binding" "credit-card-gateway-collector" {
  service_account_id = google_service_account.ccg_collector.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-gateway/credit-card-collector]",
  ]
  depends_on = [google_service_account.ccg_collector]
}

resource "google_service_account_iam_binding" "credit-card-gateway-deleter" {
  service_account_id = google_service_account.ccg_deleter.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-gateway/credit-card-deleter]",
  ]
  depends_on = [google_service_account.ccg_deleter]
}

resource "google_service_account_iam_binding" "credit-card-gateway-proxy" {
  service_account_id = google_service_account.ccg_proxy.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-gateway/credit-card-proxy]",
  ]
  depends_on = [google_service_account.ccg_proxy]
}

resource "google_service_account_iam_binding" "credit-card-gateway-viewer" {
  service_account_id = google_service_account.ccg_viewer.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-gateway/credit-card-viewer]",
  ]
  depends_on = [google_service_account.ccg_viewer]
}

resource "google_service_account_iam_binding" "credit-card-lodge-eager-beaver" {
  service_account_id = google_service_account.ccl_eager_beaver.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-lodge/eager-beaver]",
  ]
  depends_on = [google_service_account.ccl_eager_beaver]
}

resource "google_service_account_iam_binding" "credit-card-lodge-lumberjack" {
  service_account_id = google_service_account.ccl_lumberjack.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${google_project.main.id}.svc.id.goog[credit-card-lodge/lumberjack]",
  ]
  depends_on = [google_service_account.ccl_lumberjack]
}

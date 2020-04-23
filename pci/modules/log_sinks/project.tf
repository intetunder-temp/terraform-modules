resource "google_resource_manager_lien" "lien" {
  parent       = "projects/${google_project.logs.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "protect-log-project-from-deletion"
  reason       = "This project is an important environment"
}




resource "google_project" "logs" {
  name                = "LvhPay Logs ${var.environment}"
  project_id          = "lvhpay-logs-${var.environment}"
  org_id              = "1040268195710"
  billing_account     = "010B59-146AFD-9C6427"
  auto_create_network = true
}
resource "google_project_iam_audit_config" "logs_project" {
  project = google_project.logs.id
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
resource "google_project_service" "logs_services" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.logs.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}


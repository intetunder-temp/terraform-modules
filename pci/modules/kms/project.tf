resource "google_project" "sad" {
  name                = "LvhPay PCI SAD ${var.environment}"
  project_id          = "lvhpay-sad-${var.environment}"
  org_id              = "1040268195710"
  billing_account     = "010B59-146AFD-9C6427"
  auto_create_network = true
}
resource "google_project_iam_audit_config" "sad_project" {
  project = google_project.sad.id
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
resource "google_project_service" "sad_services" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.sad.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}


resource "google_project" "chd" {
  name                = "LvhPay PCI CHD ${var.environment}"
  project_id          = "lvhpay-chd-${var.environment}"
  org_id              = "1040268195710"
  billing_account     = "010B59-146AFD-9C6427"
  auto_create_network = true
}
resource "google_project_iam_audit_config" "chd_project" {
  project = google_project.chd.id
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
resource "google_project_service" "chd_services" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.chd.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}


# LODGED CARDS
resource "google_project" "sad_lodged" {
  name                = "LvhPay PCI SAD ${var.environment} LC"
  project_id          = "lvhpay-sad-${var.environment}-lodged"
  org_id              = "1040268195710"
  billing_account     = "010B59-146AFD-9C6427"
  auto_create_network = true
}
resource "google_project_iam_audit_config" "sad_project_lodged" {
  project = google_project.sad_lodged.id
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
resource "google_project_service" "sad_services_lodged" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.sad_lodged.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}

resource "google_project" "chd_lodged" {
  name                = "LvhPay PCI CHD ${var.environment} LC"
  project_id          = "lvhpay-chd-${var.environment}-lodged"
  org_id              = "1040268195710"
  billing_account     = "010B59-146AFD-9C6427"
  auto_create_network = true
}
resource "google_project_iam_audit_config" "chd_project_lodged" {
  project = google_project.chd_lodged.id
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
resource "google_project_service" "chd_services_lodged" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.chd_lodged.project_id
  service                    = each.value
  disable_on_destroy         = true
  disable_dependent_services = true
}


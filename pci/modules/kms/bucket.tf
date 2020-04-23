resource "google_storage_bucket" "sad-bucket" {
  name     = "${google_project.sad.project_id}-bucket"
  project  = google_project.sad.project_id
  location = "europe-west2"
  logging {
    log_bucket = var.audit_bucket
  }
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age                   = "7"
      matches_storage_class = ["STANDARD"]
    }
  }
}
# A bucket to store logs in
resource "google_storage_bucket" "chd-bucket" {
  name     = "${google_project.chd.project_id}-bucket"
  project  = google_project.chd.project_id
  location = "europe-west2"
  logging {
    log_bucket = var.audit_bucket
  }
  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age                   = "7"
      matches_storage_class = ["STANDARD"]
    }
  }
}

# LODGED CARDS
resource "google_storage_bucket" "sad-bucket-lodged" {
  name     = "${google_project.sad_lodged.project_id}-bucket"
  project  = google_project.sad_lodged.project_id
  location = "europe-west2"
  logging {
    log_bucket = var.audit_bucket
  }
  depends_on = [ google_project_service.sad_services_lodged ]
}
# A bucket to store logs in
resource "google_storage_bucket" "chd-bucket-lodged" {
  name     = "${google_project.chd_lodged.project_id}-bucket"
  project  = google_project.chd_lodged.project_id
  location = "europe-west2"
  logging {
    log_bucket = var.audit_bucket
  }
  depends_on = [ google_project_service.chd_services_lodged ]
}


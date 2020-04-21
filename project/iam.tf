resource "google_project_iam_member" "main" {
  project = google_project.main.id
  role    = "roles/owner"
  member  = var.owner_access
}


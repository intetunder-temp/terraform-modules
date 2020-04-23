resource "google_resource_manager_lien" "lien" {
  parent       = "projects/${google_project.main.number}"
  restrictions = ["resourcemanager.projects.delete"]
  origin       = "protect-core-project-from-deletion"
  reason       = "This project is an important environment"
}


resource "google_project" "main" {
  name                = "${var.project_name}-${var.environment}"
  project_id          = "${var.project_id}-${var.environment}"
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = var.auto_create_network
}


resource "google_project_service" "project_services" {
  for_each                   = toset(var.activate_apis)
  project                    = google_project.main.project_id
  service                    = each.value
  disable_on_destroy         = var.disable_on_destroy
  disable_dependent_services = var.disable_dependent_services
}

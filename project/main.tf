resource "google_project" "main" {
  name                = var.project_name
  project_id          = var.project_id
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = var.auto_create_network
  labels = merge(
    {
      "terraform" = "true"
    },
    var.labels
  )
}


resource "google_project_service" "project_services" {
  for_each                   = toset(var.activate_apis)
  project                    = var.project_id
  service                    = each.value
  disable_on_destroy         = var.disable_on_destroy
  disable_dependent_services = var.disable_dependent_services
}

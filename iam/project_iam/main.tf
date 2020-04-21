module "helper" {
  source       = "../helper"
  bindings     = var.bindings
  bindings_num = var.bindings_num
  mode         = var.mode
  entities     = var.projects == [] ? [var.project] : var.projects
  entities_num = var.projects_num
}


resource "google_project_iam_binding" "project_iam_authoritative" {
  count   = module.helper.count_authoritative
  project = module.helper.bindings_by_role[count.index].name
  role    = module.helper.bindings_by_role[count.index].role
  members = module.helper.bindings_by_role[count.index].members
}

resource "google_project_iam_member" "project_iam_additive" {
  count   = module.helper.count_additive
  project = module.helper.bindings_by_member[count.index].name
  role    = module.helper.bindings_by_member[count.index].role
  member  = module.helper.bindings_by_member[count.index].member
}

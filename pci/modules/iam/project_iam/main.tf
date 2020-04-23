module "helper" {
  source   = "../helper"
  bindings = var.bindings
  mode     = var.mode
  entity   = var.project
  entities = var.projects
}

/******************************************
  Project IAM binding authoritative
 *****************************************/

resource "google_project_iam_binding" "project_iam_authoritative" {
  for_each = module.helper.set_authoritative
  project  = module.helper.bindings_authoritative[each.key].name
  role     = module.helper.bindings_authoritative[each.key].role
  members  = module.helper.bindings_authoritative[each.key].members
}

/******************************************
  Project IAM binding additive
 *****************************************/

resource "google_project_iam_member" "project_iam_additive" {
  for_each = module.helper.set_additive
  project  = module.helper.bindings_additive[each.key].name
  role     = module.helper.bindings_additive[each.key].role
  member   = module.helper.bindings_additive[each.key].member
}

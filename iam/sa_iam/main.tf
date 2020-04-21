module "helper" {
  source       = "../helper"
  bindings     = var.bindings
  bindings_num = var.bindings_num
  mode         = var.mode
  entities     = var.service_accounts
  entities_num = var.service_accounts_num
}

/******************************************
  Service Account IAM binding authoritative
 *****************************************/
resource "google_service_account_iam_binding" "service_account_iam_authoritative" {
  count              = module.helper.count_authoritative
  service_account_id = "projects/${var.project}/serviceAccounts/${module.helper.bindings_by_role[count.index].name}"
  role               = module.helper.bindings_by_role[count.index].role
  members            = module.helper.bindings_by_role[count.index].members
}

/******************************************
  Service Account IAM binding additive
 *****************************************/
resource "google_service_account_iam_member" "service_account_iam_additive" {
  count              = module.helper.count_additive
  service_account_id = "projects/${var.project}/serviceAccounts/${module.helper.bindings_by_member[count.index].name}"
  role               = module.helper.bindings_by_member[count.index].role
  member             = module.helper.bindings_by_member[count.index].member
}

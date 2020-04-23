module "helper" {
  source       = "../helper"
  bindings     = var.bindings
  bindings_num = var.bindings_num
  mode         = var.mode
  entities     = var.storage_buckets
  entities_num = var.storage_buckets_num
}

resource "google_storage_bucket_iam_binding" "storage_bucket_iam_authoritative" {
  count   = module.helper.count_authoritative
  bucket  = module.helper.bindings_by_role[count.index].name
  role    = module.helper.bindings_by_role[count.index].role
  members = module.helper.bindings_by_role[count.index].members
}

resource "google_storage_bucket_iam_member" "storage_bucket_iam_additive" {
  count  = module.helper.count_additive
  bucket = module.helper.bindings_by_member[count.index].name
  role   = module.helper.bindings_by_member[count.index].role
  member = module.helper.bindings_by_member[count.index].member
}

output "storage_buckets" {
  value       = distinct(module.helper.bindings_by_member[*].name)
  description = "Storage Buckets which received bindings."
}

output "roles" {
  value       = distinct(module.helper.bindings_by_member[*].role)
  description = "Roles which were assigned to members."
}

output "members" {
  value       = distinct(module.helper.bindings_by_member[*].member)
  description = "Members which were bound to the Storage Bucket."
}

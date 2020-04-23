output "service_accounts" {
  value       = distinct(module.helper.bindings_by_member[*].name)
  description = "Service Accounts which received bindings."
}

output "roles" {
  value       = distinct(module.helper.bindings_by_member[*].role)
  description = "Roles which were assigned to members."
}

output "members" {
  value       = distinct(module.helper.bindings_by_member[*].member)
  description = "Members which were bound to the Service Account."
}

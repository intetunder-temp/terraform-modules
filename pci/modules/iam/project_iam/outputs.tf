
output "projects" {
  value       = distinct(module.helper.bindings_by_member[*].name)
  description = "Projects wich received bindings."
}

output "roles" {
  value       = distinct(module.helper.bindings_by_member[*].role)
  description = "Roles which were assigned to members."
}

output "members" {
  value       = distinct(module.helper.bindings_by_member[*].member)
  description = "Members which were bound to projects."
}

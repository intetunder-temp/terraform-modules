output "bindings_by_role" {
  value       = local.bindings_by_role
  description = "List of bindings for entities unwinded by roles."
}

output "bindings_by_member" {
  value       = local.bindings_by_member
  description = "List of bindings for entities unwinded by members."
}

output "count_authoritative" {
  value       = local.count_authoritative
  description = "Count of authoritative iam rules to apply. 0 for non-authoritative mode."
}

output "count_additive" {
  value       = local.count_additive
  description = "Count of additive iam rules to apply. 0 for non-additive mode."
}

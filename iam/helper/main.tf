locals {
  authoritative = var.mode == "authoritative" ? 1 : 0
  additive      = var.mode == "additive" ? 1 : 0

  calculated_entities_num = (
    var.entities_num == 0
    ? length(var.entities)
    : var.entities_num
  )

  bindings_by_role = distinct(flatten([
    for name in var.entities
    : [
      for role, members in var.bindings
      : { name = name, role = role, members = members }
    ]
  ]))

  bindings_by_member = distinct(flatten([
    for binding in local.bindings_by_role
    : [
      for member in binding["members"]
      : { name = binding["name"], role = binding["role"], member = member }
    ]
  ]))

  count_authoritative = local.authoritative * (
    var.bindings_num > 0
    ? var.bindings_num * local.calculated_entities_num
    : length(local.bindings_by_role)
  )

  count_additive = local.additive * (
    var.bindings_num > 0
    ? var.bindings_num * local.calculated_entities_num
    : length(local.bindings_by_member)
  )
}

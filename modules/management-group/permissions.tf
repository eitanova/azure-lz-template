locals {
  _users = merge(flatten([
    for role, principals in var.rbac : [
      for principal in principals : {
        "${role}/${principal}" = {
          role = role
          name = trimprefix(principal, "user:")
        }
      }
      if startswith(principal, "user:")
    ]
    ])...
  )
  _groups = merge(flatten([
    for role, principals in var.rbac : [
      for principal in principals : {
        "${role}/${principal}" = {
          role = role
          name = trimprefix(principal, "group:")
        }
      }
      if startswith(principal, "group:")
    ]
    ])...
  )
  principals = merge(
    {
      for k, v in local._users : k =>
      {
        role      = v.role
        object_id = data.azuread_user.users[k].object_id
      }
    },
    {
      for k, v in local._groups : k =>
      {
        role      = v.role
        object_id = data.azuread_group.groups[k].object_id
      }
  })
}
data "azuread_group" "groups" {
  for_each     = local._groups
  display_name = each.value.name
}
data "azuread_user" "users" {
  for_each            = local._users
  user_principal_name = each.value.name
}

resource "azurerm_role_assignment" "rbac" {
  for_each = local.principals
  scope                = azurerm_management_group.management_group.id
  role_definition_name = each.value.role
  principal_id         = each.value.object_id
}
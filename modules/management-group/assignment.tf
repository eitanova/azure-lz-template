data "azurerm_policy_definition" "policies" {
  for_each     = toset(var.assignments)
  display_name = each.value
}

resource "azurerm_management_group_policy_assignment" "assignments" {
  for_each             = toset(var.assignments)
  name                 = each.value
  policy_definition_id = data.azurerm_policy_definition.policies[each.key].id
  management_group_id  = azurerm_management_group.management_group.id
}

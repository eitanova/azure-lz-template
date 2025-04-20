resource "random_uuid" "definition_id" {}

resource "azurerm_policy_set_definition" "initiative" {
  for_each = var.initiatives

  name                = each.value.id ? each.value.id : random_uuid.definition_id.result
  display_name        = each.value.name
  description         = each.value.description
  management_group_id = each.value.scope
  policy_type         = "Custom"

  dynamic "policy_definition_reference" {
    # Iterate through each policy in each category
    for_each = flatten([for category in each.value.policies : category])

    content {
      policy_definition_id = policy_definition_reference.value.policyDefinitionId

      # Handle parameters for each policy
      parameter_values = length(lookup(policy_definition_reference.value, "parameters", {})) > 0 ? jsonencode({
        for k, v in lookup(policy_definition_reference.value, "parameters", {}) : k => {
          value = v
        }
      }) : null
    }
  }

  timeouts {
    read = "10m"
  }
}

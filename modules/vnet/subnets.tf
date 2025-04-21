resource "azurerm_subnet" "subnets" {
  for_each = var.subnets

  name             = each.key
  address_prefixes = each.value.address_prefixes

  default_outbound_access_enabled = var.outbound_access
  resource_group_name             = var.parent_resource_group
  virtual_network_name            = var.name
}

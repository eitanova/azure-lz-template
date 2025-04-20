resource "azurerm_virtual_network_peering" "one_way_peering" {
  for_each                  = var.peering

  name                      = each.key
  resource_group_name       = var.parent_resource_group
  virtual_network_name      = var.name
  remote_virtual_network_id = each.value.target_id
  allow_gateway_transit     = each.value.allow_gateway_transit
}
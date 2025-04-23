resource "azurerm_virtual_network_peering" "one_way" {
  name                         = var.source_peering.name
  resource_group_name          = var.source_peering.resource_group_name
  virtual_network_name         = var.source_peering.virtual_network_name
  remote_virtual_network_id    = var.source_peering.remote_virtual_network_id
  allow_virtual_network_access = var.source_peering.allow_virtual_network_access
  allow_forwarded_traffic      = var.source_peering.allow_forwarded_traffic
  allow_gateway_transit        = var.source_peering.allow_gateway_transit
  use_remote_gateways          = var.source_peering.use_remote_gateways

  provider = azurerm.source
}

resource "azurerm_virtual_network_peering" "two_way" {
  name                         = var.target_peering.name
  resource_group_name          = var.target_peering.resource_group_name
  virtual_network_name         = var.target_peering.virtual_network_name
  remote_virtual_network_id    = var.target_peering.remote_virtual_network_id
  allow_virtual_network_access = var.target_peering.allow_virtual_network_access
  allow_forwarded_traffic      = var.target_peering.allow_forwarded_traffic
  allow_gateway_transit        = var.target_peering.allow_gateway_transit
  use_remote_gateways          = var.target_peering.use_remote_gateways

  provider = azurerm.target
}

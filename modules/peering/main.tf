resource "azurerm_virtual_network_peering" "one_way" {
  name                         = var.source.name
  resource_group_name          = var.source.resource_group_name
  virtual_network_name         = var.source.virtual_network_name
  remote_virtual_network_id    = var.source.remote_virtual_network_id
  allow_virtual_network_access = var.source.allow_virtual_network_access
  allow_forwarded_traffic      = var.source.allow_forwarded_traffic
  allow_gateway_transit        = var.source.allow_gateway_transit
  use_remote_gateways          = var.source.use_remote_gateways

  provider = azurerm.source
}

resource "azurerm_virtual_network_peering" "two_way" {
  name                         = var.target.name
  resource_group_name          = var.target.resource_group_name
  virtual_network_name         = var.target.virtual_network_name
  remote_virtual_network_id    = var.target.remote_virtual_network_id
  allow_virtual_network_access = var.target.allow_virtual_network_access
  allow_forwarded_traffic      = var.target.allow_forwarded_traffic
  allow_gateway_transit        = var.target.allow_gateway_transit
  use_remote_gateways          = var.target.use_remote_gateways

  provider = azurerm.target
}
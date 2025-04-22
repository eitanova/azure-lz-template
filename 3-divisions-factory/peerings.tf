resource "azurerm_virtual_network_peering" "untrusted_prod_to_internet" {
  count = (var.hub_config.environment == "prod" || var.hub_config.environment == "ppd") && var.hub_config.trust_level == "untrusted" ? 1 : 0

  name                         = "${var.hub_config.virtual_network_name}-to-internet"
  resource_group_name          = var.hub_config.resource_group_name
  virtual_network_name         = var.hub_config.virtual_network_name
  remote_virtual_network_id    = var.prod_internet_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.division_hub]
}

resource "azurerm_virtual_network_peering" "internet_to_untrusted_prod" {
  count = (var.hub_config.environment == "prod" || var.hub_config.environment == "ppd") && var.hub_config.trust_level == "untrusted" ? 1 : 0

  name                         = "internet-to-${var.hub_config.virtual_network_name}"
  resource_group_name          = var.prod_internet_vnet_id
  virtual_network_name         = var.prod_internet_vnet_name
  remote_virtual_network_id    = module.division_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.division_hub]

  provider = azurerm.internet-prd
}

resource "azurerm_virtual_network_peering" "trusted_prod_to_on_prem" {
  count = var.hub_config.environment == "prod" && var.hub_config.trust_level == "trusted" ? 1 : 0

  name                         = "${var.hub_config.virtual_network_name}-to-on-prem"
  resource_group_name          = var.hub_config.resource_group_name
  virtual_network_name         = var.hub_config.virtual_network_name
  remote_virtual_network_id    = var.on_prem_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.division_hub]
}

resource "azurerm_virtual_network_peering" "on_prem_to_trusted_prod" {
  count = var.hub_config.environment == "prod" && var.hub_config.trust_level == "trusted" ? 1 : 0

  name                         = "on-prem-to-${var.hub_config.virtual_network_name}"
  resource_group_name          = var.on_prem_vnet_name
  virtual_network_name         = var.on_prem_vnet_name
  remote_virtual_network_id    = module.division_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.division_hub]

  provider = azurerm.on-prem
}


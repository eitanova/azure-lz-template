# Untrusted PROD <-> PROD Internet
resource "azurerm_virtual_network_peering" "untrusted_prod_to_internet" {
  name                         = "${local.untrusted_prod_hubs[var.division_name].virtual_network_name}-to-internet"
  resource_group_name          = local.untrusted_prod_hubs[var.division_name].resource_group_name
  virtual_network_name         = local.untrusted_prod_hubs[var.division_name].virtual_network_name
  remote_virtual_network_id    = var.prod_internet_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.current-untrusted-prod
  depends_on = [module.division_untrusted_prod_hub]
}

resource "azurerm_virtual_network_peering" "internet_to_untrusted_prod" {
  name                         = "internet-to-${local.untrusted_prod_hubs[var.division_name].virtual_network_name}"
  resource_group_name          = var.prod_internet_vnet_rg
  virtual_network_name         = var.prod_internet_vnet_name
  remote_virtual_network_id    = module.division_untrusted_prod_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.internet-prd
  depends_on = [module.division_untrusted_prod_hub]
}

# Untrusted PPD <-> PROD Internet
resource "azurerm_virtual_network_peering" "untrusted_ppd_to_internet" {
  name                         = "${local.untrusted_ppd_hubs[var.division_name].virtual_network_name}-to-internet"
  resource_group_name          = local.untrusted_ppd_hubs[var.division_name].resource_group_name
  virtual_network_name         = local.untrusted_ppd_hubs[var.division_name].virtual_network_name
  remote_virtual_network_id    = var.prod_internet_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.current-untrusted-ppd
  depends_on = [module.division_untrusted_ppd_hub]
}

resource "azurerm_virtual_network_peering" "internet_to_untrusted_ppd" {
  name                         = "internet-to-${local.untrusted_ppd_hubs[var.division_name].virtual_network_name}"
  resource_group_name          = var.prod_internet_vnet_rg
  virtual_network_name         = var.prod_internet_vnet_name
  remote_virtual_network_id    = module.division_untrusted_ppd_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.internet-prd
  depends_on = [module.division_untrusted_ppd_hub]
}

# Trusted PROD <-> On-Prem
resource "azurerm_virtual_network_peering" "trusted_prod_to_on_prem" {
  name                         = "${local.trusted_prod_hubs[var.division_name].virtual_network_name}-to-on-prem"
  resource_group_name          = local.trusted_prod_hubs[var.division_name].resource_group_name
  virtual_network_name         = local.trusted_prod_hubs[var.division_name].virtual_network_name
  remote_virtual_network_id    = var.on_prem_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.current-trusted-prod
  depends_on = [module.division_trusted_prod_hub]
}

resource "azurerm_virtual_network_peering" "on_prem_to_trusted_prod" {
  name                         = "on-prem-to-${local.trusted_prod_hubs[var.division_name].virtual_network_name}"
  resource_group_name          = var.on_prem_vnet_rg
  virtual_network_name         = var.on_prem_vnet_name
  remote_virtual_network_id    = module.division_trusted_prod_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false

  provider = azurerm.on-prem
  depends_on = [module.division_trusted_prod_hub]
}

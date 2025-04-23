# Untrusted PROD <-> PROD Internet
module "untrusted_prod_internet_peering" {
  source = "../modules/peering"

  source_peering = {
    name                         = "${local.untrusted_prod_hub.virtual_network_name}-to-internet"
    resource_group_name          = local.untrusted_prod_hub.resource_group_name
    virtual_network_name         = local.untrusted_prod_hub.virtual_network_name
    remote_virtual_network_id    = var.prod_internet_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "internet-to-${local.untrusted_prod_hub.virtual_network_name}"
    resource_group_name          = var.prod_internet_vnet_rg
    virtual_network_name         = var.prod_internet_vnet_name
    remote_virtual_network_id    = module.division_untrusted_prod_hub.id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.current-untrusted-prd
    azurerm.target = azurerm.internet-prd
  }

  depends_on = [module.division_untrusted_prod_hub]
}

# Untrusted PPD <-> PROD Internet
module "untrusted_ppd_internet_peering" {
  source = "../modules/peering"

  source_peering = {
    name                         = "${local.untrusted_ppd_hub.virtual_network_name}-to-internet"
    resource_group_name          = local.untrusted_ppd_hub.resource_group_name
    virtual_network_name         = local.untrusted_ppd_hub.virtual_network_name
    remote_virtual_network_id    = var.prod_internet_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "internet-to-${local.untrusted_ppd_hub.virtual_network_name}"
    resource_group_name          = var.prod_internet_vnet_rg
    virtual_network_name         = var.prod_internet_vnet_name
    remote_virtual_network_id    = module.division_untrusted_ppd_hub.id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.current-untrusted-ppd
    azurerm.target = azurerm.internet-prd
  }

  depends_on = [module.division_untrusted_ppd_hub]
}

# Trusted PROD <-> On-Prem
module "trusted_prod_on_prem_peering" {
  source = "../modules/peering"

  source_peering = {
    name                         = "${local.trusted_prod_hub.virtual_network_name}-to-on-prem"
    resource_group_name          = local.trusted_prod_hub.resource_group_name
    virtual_network_name         = local.trusted_prod_hub.virtual_network_name
    remote_virtual_network_id    = var.on_prem_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "on-prem-to-${local.trusted_prod_hub.virtual_network_name}"
    resource_group_name          = var.on_prem_vnet_rg
    virtual_network_name         = var.on_prem_vnet_name
    remote_virtual_network_id    = module.division_trusted_prod_hub.id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.current-trusted-prd
    azurerm.target = azurerm.on-prem
  }

  depends_on = [module.division_trusted_prod_hub]
}

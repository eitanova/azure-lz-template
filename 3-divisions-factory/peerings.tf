# Untrusted PROD <-> PROD Internet
module "untrusted_prod_internet_peerings" {
  for_each = { for idx, hub in local.untrusted_prod_hubs : hub.name => hub }

  source = "../modules/peering"

  source_peering = {
    name                         = "${each.value.virtual_network_name}-to-internet"
    resource_group_name          = each.value.resource_group_name
    virtual_network_name         = each.value.virtual_network_name
    remote_virtual_network_id    = var.prod_internet_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "internet-to-${each.value.virtual_network_name}"
    resource_group_name          = var.prod_internet_vnet_rg
    virtual_network_name         = var.prod_internet_vnet_name
    remote_virtual_network_id    = module.division_untrusted_prod_hubs[each.key].id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.untrusted-prd
    azurerm.target = azurerm.internet-prd
  }

  depends_on = [module.division_untrusted_prod_hubs]
}

# Untrusted PPD <-> PROD Internet
module "untrusted_ppd_internet_peerings" {
  for_each = { for idx, hub in local.untrusted_ppd_hubs : hub.name => hub }

  source = "../modules/peering"

  source_peering = {
    name                         = "${each.value.virtual_network_name}-to-internet"
    resource_group_name          = each.value.resource_group_name
    virtual_network_name         = each.value.virtual_network_name
    remote_virtual_network_id    = var.prod_internet_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "internet-to-${each.value.virtual_network_name}"
    resource_group_name          = var.prod_internet_vnet_rg
    virtual_network_name         = var.prod_internet_vnet_name
    remote_virtual_network_id    = module.division_untrusted_ppd_hubs[each.key].id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.untrusted-ppd
    azurerm.target = azurerm.internet-prd
  }

  depends_on = [module.division_untrusted_ppd_hubs]
}

# Trusted PROD <-> On-Prem
module "trusted_prod_on_prem_peerings" {
  for_each = { for idx, hub in local.trusted_prod_hubs : hub.name => hub }

  source = "../modules/peering"

  source_peering = {
    name                         = "${each.value.virtual_network_name}-to-on-prem"
    resource_group_name          = each.value.resource_group_name
    virtual_network_name         = each.value.virtual_network_name
    remote_virtual_network_id    = var.on_prem_vnet_id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "on-prem-to-${each.value.virtual_network_name}"
    resource_group_name          = var.on_prem_vnet_rg
    virtual_network_name         = var.on_prem_vnet_name
    remote_virtual_network_id    = module.division_trusted_prod_hubs[each.key].id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.trusted-prd
    azurerm.target = azurerm.on-prem
  }

  depends_on = [module.division_trusted_prod_hubs]
}

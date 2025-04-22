module "division_trusted_prod_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.trusted_prod_hub.resource_group_name
  resource_group_location       = local.trusted_prod_hub.resource_group_location
  virtual_network_name          = local.trusted_prod_hub.virtual_network_name
  virtual_network_address_space = local.trusted_prod_hub.virtual_network_address_space
  dns_servers                   = local.trusted_prod_hub.dns_servers
  subnets                       = local.trusted_prod_hub.subnets
  route_table                   = local.trusted_prod_hub.route_table

  providers = {
    azurerm = azurerm.current-trusted-prd
  }

  depends_on = [module.division_trusted_prod_rg]
}

module "division_untrusted_prod_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.untrusted_prod_hub.resource_group_name
  resource_group_location       = local.untrusted_prod_hub.resource_group_location
  virtual_network_name          = local.untrusted_prod_hub.virtual_network_name
  virtual_network_address_space = local.untrusted_prod_hub.virtual_network_address_space
  dns_servers                   = local.untrusted_prod_hub.dns_servers
  subnets                       = local.untrusted_prod_hub.subnets
  route_table                   = local.untrusted_prod_hub.route_table

  providers = {
    azurerm = azurerm.current-untrusted-prd
  }

  depends_on = [module.division_untrusted_prod_rg]
}

module "division_trusted_ppd_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.trusted_ppd_hub.resource_group_name
  resource_group_location       = local.trusted_ppd_hub.resource_group_location
  virtual_network_name          = local.trusted_ppd_hub.virtual_network_name
  virtual_network_address_space = local.trusted_ppd_hub.virtual_network_address_space
  dns_servers                   = local.trusted_ppd_hub.dns_servers
  subnets                       = local.trusted_ppd_hub.subnets
  route_table                   = local.trusted_ppd_hub.route_table

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }

  depends_on = [module.division_trusted_ppd_rg]
}

module "division_untrusted_ppd_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.untrusted_ppd_hub.resource_group_name
  resource_group_location       = local.untrusted_ppd_hub.resource_group_location
  virtual_network_name          = local.untrusted_ppd_hub.virtual_network_name
  virtual_network_address_space = local.untrusted_ppd_hub.virtual_network_address_space
  dns_servers                   = local.untrusted_ppd_hub.dns_servers
  subnets                       = local.untrusted_ppd_hub.subnets
  route_table                   = local.untrusted_ppd_hub.route_table

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }

  depends_on = [module.division_untrusted_ppd_rg]
}

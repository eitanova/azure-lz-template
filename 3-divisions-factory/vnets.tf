module "division-trusted-prod-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.trusted_prod_hubs[var.division_name].resource_group_name
  resource_group_location       = local.trusted_prod_hubs[var.division_name].resource_group_location
  virtual_network_name          = local.trusted_prod_hubs[var.division_name].virtual_network_name
  virtual_network_address_space = local.trusted_prod_hubs[var.division_name].virtual_network_address_space
  dns_servers                   = local.trusted_prod_hubs[var.division_name].dns_servers
  subnets                       = local.trusted_prod_hubs[var.division_name].subnets
  route_table                   = local.trusted_prod_hubs[var.division_name].route_table

  providers = {
    azurerm = azurerm.current-trusted-prod
  }

  depends_on = [module.division-trusted-prod-rg]
}

module "division-untrusted-prod-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.untrusted_prod_hubs[var.division_name].resource_group_name
  resource_group_location       = local.untrusted_prod_hubs[var.division_name].resource_group_location
  virtual_network_name          = local.untrusted_prod_hubs[var.division_name].virtual_network_name
  virtual_network_address_space = local.untrusted_prod_hubs[var.division_name].virtual_network_address_space
  dns_servers                   = local.untrusted_prod_hubs[var.division_name].dns_servers
  subnets                       = local.untrusted_prod_hubs[var.division_name].subnets
  route_table                   = local.untrusted_prod_hubs[var.division_name].route_table

  providers = {
    azurerm = azurerm.current-untrusted-prod
  }

  depends_on = [module.division-untrusted-prod-rg]
}

module "division-trusted-ppd-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.trusted_ppd_hubs[var.division_name].resource_group_name
  resource_group_location       = local.trusted_ppd_hubs[var.division_name].resource_group_location
  virtual_network_name          = local.trusted_ppd_hubs[var.division_name].virtual_network_name
  virtual_network_address_space = local.trusted_ppd_hubs[var.division_name].virtual_network_address_space
  dns_servers                   = local.trusted_ppd_hubs[var.division_name].dns_servers
  subnets                       = local.trusted_ppd_hubs[var.division_name].subnets
  route_table                   = local.trusted_ppd_hubs[var.division_name].route_table

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }

  depends_on = [module.division-trusted-ppd-rg]
}

module "division-untrusted-ppd-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.untrusted_ppd_hubs[var.division_name].resource_group_name
  resource_group_location       = local.untrusted_ppd_hubs[var.division_name].resource_group_location
  virtual_network_name          = local.untrusted_ppd_hubs[var.division_name].virtual_network_name
  virtual_network_address_space = local.untrusted_ppd_hubs[var.division_name].virtual_network_address_space
  dns_servers                   = local.untrusted_ppd_hubs[var.division_name].dns_servers
  subnets                       = local.untrusted_ppd_hubs[var.division_name].subnets
  route_table                   = local.untrusted_ppd_hubs[var.division_name].route_table

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }

  depends_on = [module.division-untrusted-ppd-rg]
}

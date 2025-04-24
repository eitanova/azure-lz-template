# Trusted Production Hubs
module "division_trusted_prod_hubs" {
  for_each = { for idx, hub in local.trusted_prod_hubs : hub.name => hub }

  source = "../modules/hub-vnet"

  resource_group_name           = each.value.resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = each.value.virtual_network_name
  virtual_network_address_space = each.value.virtual_network_address_space
  dns_servers                   = each.value.dns_servers
  subnets                       = each.value.subnets
  route_tables                  = each.value.route_tables
  subnet_route_table_map        = { for subnet_name, _ in each.value.subnets : subnet_name => keys(each.value.route_tables)[0] }

  providers = {
    azurerm = azurerm.trusted-prd
  }

  depends_on = [module.division_trusted_prod_rgs]
}

# Untrusted Production Hubs
module "division_untrusted_prod_hubs" {
  for_each = { for idx, hub in local.untrusted_prod_hubs : hub.name => hub }

  source = "../modules/hub-vnet"

  resource_group_name           = each.value.resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = each.value.virtual_network_name
  virtual_network_address_space = each.value.virtual_network_address_space
  dns_servers                   = each.value.dns_servers
  subnets                       = each.value.subnets
  route_tables                  = each.value.route_tables
  subnet_route_table_map        = { for subnet_name, _ in each.value.subnets : subnet_name => keys(each.value.route_tables)[0] }

  providers = {
    azurerm = azurerm.untrusted-prd
  }

  depends_on = [module.division_untrusted_prod_rgs]
}

# Trusted PPD Hubs
module "division_trusted_ppd_hubs" {
  for_each = { for idx, hub in local.trusted_ppd_hubs : hub.name => hub }

  source = "../modules/hub-vnet"

  resource_group_name           = each.value.resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = each.value.virtual_network_name
  virtual_network_address_space = each.value.virtual_network_address_space
  dns_servers                   = each.value.dns_servers
  subnets                       = each.value.subnets
  route_tables                  = each.value.route_tables
  subnet_route_table_map        = { for subnet_name, _ in each.value.subnets : subnet_name => keys(each.value.route_tables)[0] }

  providers = {
    azurerm = azurerm.trusted-ppd
  }

  depends_on = [module.division_trusted_ppd_rgs]
}

# Untrusted PPD Hubs
module "division_untrusted_ppd_hubs" {
  for_each = { for idx, hub in local.untrusted_ppd_hubs : hub.name => hub }

  source = "../modules/hub-vnet"

  resource_group_name           = each.value.resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = each.value.virtual_network_name
  virtual_network_address_space = each.value.virtual_network_address_space
  dns_servers                   = each.value.dns_servers
  subnets                       = each.value.subnets
  route_tables                  = each.value.route_tables
  subnet_route_table_map        = { for subnet_name, _ in each.value.subnets : subnet_name => keys(each.value.route_tables)[0] }

  providers = {
    azurerm = azurerm.untrusted-ppd
  }

  depends_on = [module.division_untrusted_ppd_rgs]
}

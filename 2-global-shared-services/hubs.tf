module "internet_prd_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-prd"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["internet-prd"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-prd"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-prd"].dns_servers
  subnets                       = local.global_hubs["internet-prd"].subnets
  route_tables                  = local.global_hubs["internet-prd"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["internet-prd"].subnets : subnet_name => keys(local.global_hubs["internet-prd"].route_tables)[0] }

  providers = {
    azurerm = azurerm.internet-prd
  }

  depends_on = [module.internet_prd_rg]
}

module "internet_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-dev"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["internet-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-dev"].dns_servers
  subnets                       = local.global_hubs["internet-dev"].subnets
  route_tables                  = local.global_hubs["internet-dev"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["internet-dev"].subnets : subnet_name => keys(local.global_hubs["internet-dev"].route_tables)[0] }

  providers = {
    azurerm = azurerm.internet-dev
  }

  depends_on = [module.internet_dev_rg]
}

module "trusted_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["trusted-dev"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["trusted-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["trusted-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["trusted-dev"].dns_servers
  subnets                       = local.global_hubs["trusted-dev"].subnets
  route_tables                  = local.global_hubs["trusted-dev"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["trusted-dev"].subnets : subnet_name => keys(local.global_hubs["trusted-dev"].route_tables)[0] }

  providers = {
    azurerm = azurerm.trusted-dev
  }

  depends_on = [module.trusted_dev_rg]
}

module "untrusted_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["untrusted-dev"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["untrusted-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["untrusted-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["untrusted-dev"].dns_servers
  subnets                       = local.global_hubs["untrusted-dev"].subnets
  route_tables                  = local.global_hubs["untrusted-dev"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["untrusted-dev"].subnets : subnet_name => keys(local.global_hubs["untrusted-dev"].route_tables)[0] }

  providers = {
    azurerm = azurerm.untrusted-dev
  }

  depends_on = [module.untrusted_dev_rg]
}

module "mgmt_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["mgmt"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["mgmt"].virtual_network_name
  virtual_network_address_space = local.global_hubs["mgmt"].virtual_network_address_space
  dns_servers                   = local.global_hubs["mgmt"].dns_servers
  subnets                       = local.global_hubs["mgmt"].subnets
  route_tables                  = local.global_hubs["mgmt"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["mgmt"].subnets : subnet_name => keys(local.global_hubs["mgmt"].route_tables)[0] }

  providers = {
    azurerm = azurerm.mgmt
  }

  depends_on = [module.mgmt_rg]
}

module "on_prem_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["on-prem"].resource_group_name
  resource_group_location       = var.tenant.location
  virtual_network_name          = local.global_hubs["on-prem"].virtual_network_name
  virtual_network_address_space = local.global_hubs["on-prem"].virtual_network_address_space
  dns_servers                   = local.global_hubs["on-prem"].dns_servers
  subnets                       = local.global_hubs["on-prem"].subnets
  route_tables                  = local.global_hubs["on-prem"].route_tables
  subnet_route_table_map        = { for subnet_name, _ in local.global_hubs["on-prem"].subnets : subnet_name => keys(local.global_hubs["on-prem"].route_tables)[0] }

  providers = {
    azurerm = azurerm.on-prem
  }

  depends_on = [module.on_prem_rg]
}

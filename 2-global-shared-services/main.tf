locals {
  dev_hubs  = yamldecode(file("${path.root}/config-dev/networking/hubs/development.yml"))
  mgmt_hubs = yamldecode(file("${path.root}/config-dev/networking/hubs/management.yml"))
  prod_hubs = yamldecode(file("${path.root}/config-dev/networking/hubs/production.yml"))

  global_hubs = merge(
    local.dev_hubs.hubs,
    local.mgmt_hubs.hubs,
    local.prod_hubs.hubs
  )
}

module "internet_prd_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["internet-prd"].resource_group_name
  location = local.global_hubs["internet-prd"].resource_group_location
  tags     = local.global_hubs["internet-prd"].resource_group_tags

  providers = {
    azurerm = azurerm.internet-prd
  }
}

module "internet_prd_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-prd"].resource_group_name
  resource_group_location       = local.global_hubs["internet-prd"].resource_group_location
  virtual_network_name          = local.global_hubs["internet-prd"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-prd"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-prd"].dns_servers
  subnets                       = local.global_hubs["internet-prd"].subnets
  route_table                   = local.global_hubs["internet-prd"].route_table

  providers = {
    azurerm = azurerm.internet-prd
  }

  depends_on = [module.internet_prd_rg]
}

module "internet_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["internet-dev"].resource_group_name
  location = local.global_hubs["internet-dev"].resource_group_location
  tags     = local.global_hubs["internet-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.internet-dev
  }
}

module "internet_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-dev"].resource_group_name
  resource_group_location       = local.global_hubs["internet-dev"].resource_group_location
  virtual_network_name          = local.global_hubs["internet-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-dev"].dns_servers
  subnets                       = local.global_hubs["internet-dev"].subnets
  route_table                   = local.global_hubs["internet-dev"].route_table

  providers = {
    azurerm = azurerm.internet-dev
  }

  depends_on = [module.internet_dev_rg]
}

module "trusted_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["trusted-dev"].resource_group_name
  location = local.global_hubs["trusted-dev"].resource_group_location
  tags     = local.global_hubs["trusted-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.trusted-dev
  }
}

module "trusted_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["trusted-dev"].resource_group_name
  resource_group_location       = local.global_hubs["trusted-dev"].resource_group_location
  virtual_network_name          = local.global_hubs["trusted-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["trusted-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["trusted-dev"].dns_servers
  subnets                       = local.global_hubs["trusted-dev"].subnets
  route_table                   = local.global_hubs["trusted-dev"].route_table

  providers = {
    azurerm = azurerm.trusted-dev
  }

  depends_on = [module.trusted_dev_rg]
}

module "untrusted_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["untrusted-dev"].resource_group_name
  location = local.global_hubs["untrusted-dev"].resource_group_location
  tags     = local.global_hubs["untrusted-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.untrusted-dev
  }
}

module "untrusted_dev_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["untrusted-dev"].resource_group_name
  resource_group_location       = local.global_hubs["untrusted-dev"].resource_group_location
  virtual_network_name          = local.global_hubs["untrusted-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["untrusted-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["untrusted-dev"].dns_servers
  subnets                       = local.global_hubs["untrusted-dev"].subnets
  route_table                   = local.global_hubs["untrusted-dev"].route_table

  providers = {
    azurerm = azurerm.untrusted-dev
  }

  depends_on = [module.untrusted_dev_rg]
}

module "mgmt_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["mgmt"].resource_group_name
  location = local.global_hubs["mgmt"].resource_group_location
  tags     = local.global_hubs["mgmt"].resource_group_tags

  providers = {
    azurerm = azurerm.mgmt
  }
}

module "mgmt_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["mgmt"].resource_group_name
  resource_group_location       = local.global_hubs["mgmt"].resource_group_location
  virtual_network_name          = local.global_hubs["mgmt"].virtual_network_name
  virtual_network_address_space = local.global_hubs["mgmt"].virtual_network_address_space
  dns_servers                   = local.global_hubs["mgmt"].dns_servers
  subnets                       = local.global_hubs["mgmt"].subnets
  route_table                   = local.global_hubs["mgmt"].route_table

  providers = {
    azurerm = azurerm.mgmt
  }

  depends_on = [module.mgmt_rg]
}

module "on_prem_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["on-prem"].resource_group_name
  location = local.global_hubs["on-prem"].resource_group_location
  tags     = local.global_hubs["on-prem"].resource_group_tags

  providers = {
    azurerm = azurerm.on-prem
  }
}

module "on_prem_hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["on-prem"].resource_group_name
  resource_group_location       = local.global_hubs["on-prem"].resource_group_location
  virtual_network_name          = local.global_hubs["on-prem"].virtual_network_name
  virtual_network_address_space = local.global_hubs["on-prem"].virtual_network_address_space
  dns_servers                   = local.global_hubs["on-prem"].dns_servers
  subnets                       = local.global_hubs["on-prem"].subnets
  route_table                   = local.global_hubs["on-prem"].route_table

  providers = {
    azurerm = azurerm.on-prem
  }

  depends_on = [module.on_prem_rg]
}

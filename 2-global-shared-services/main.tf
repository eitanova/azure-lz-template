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


module "internet-prd-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-prd"].resource_group_name
  resource_group_location       = local.global_hubs["internet-prd"].resource_group_location
  resource_group_tags           = local.global_hubs["internet-prd"].resource_group_tags
  virtual_network_name          = local.global_hubs["internet-prd"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-prd"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-prd"].dns_servers
  subnets                       = local.global_hubs["internet-prd"].subnets
  route_table                   = local.global_hubs["internet-prd"].route_table

  providers = {
    azurerm = azurerm.internet-prd
  }
}

module "internet-dev-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-dev"].resource_group_name
  resource_group_location       = local.global_hubs["internet-dev"].resource_group_location
  resource_group_tags           = local.global_hubs["internet-dev"].resource_group_tags
  virtual_network_name          = local.global_hubs["internet-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-dev"].dns_servers
  subnets                       = local.global_hubs["internet-dev"].subnets
  route_table                   = local.global_hubs["internet-dev"].route_table

  providers = {
    azurerm = azurerm.internet-dev
  }
}

module "trusted-dev-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["internet-dev"].resource_group_name
  resource_group_location       = local.global_hubs["internet-dev"].resource_group_location
  resource_group_tags           = local.global_hubs["internet-dev"].resource_group_tags
  virtual_network_name          = local.global_hubs["internet-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["internet-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["internet-dev"].dns_servers
  subnets                       = local.global_hubs["internet-dev"].subnets
  route_table                   = local.global_hubs["internet-dev"].route_table

  providers = {
    azurerm = azurerm.internet-dev
  }
}

module "untrusted-dev-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["untrusted-dev"].resource_group_name
  resource_group_location       = local.global_hubs["untrusted-dev"].resource_group_location
  resource_group_tags           = local.global_hubs["untrusted-dev"].resource_group_tags
  virtual_network_name          = local.global_hubs["untrusted-dev"].virtual_network_name
  virtual_network_address_space = local.global_hubs["untrusted-dev"].virtual_network_address_space
  dns_servers                   = local.global_hubs["untrusted-dev"].dns_servers
  subnets                       = local.global_hubs["untrusted-dev"].subnets
  route_table                   = local.global_hubs["untrusted-dev"].route_table

  providers = {
    azurerm = azurerm.untrusted-dev
  }
}

module "mgmt-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["mgmt"].resource_group_name
  resource_group_location       = local.global_hubs["mgmt"].resource_group_location
  resource_group_tags           = local.global_hubs["mgmt"].resource_group_tags
  virtual_network_name          = local.global_hubs["mgmt"].virtual_network_name
  virtual_network_address_space = local.global_hubs["mgmt"].virtual_network_address_space
  dns_servers                   = local.global_hubs["mgmt"].dns_servers
  subnets                       = local.global_hubs["mgmt"].subnets
  route_table                   = local.global_hubs["mgmt"].route_table

  providers = {
    azurerm = azurerm.mgmt
  }
}

module "on-prem-hub" {
  source = "../modules/hub-vnet"

  resource_group_name           = local.global_hubs["on-prem"].resource_group_name
  resource_group_location       = local.global_hubs["on-prem"].resource_group_location
  resource_group_tags           = local.global_hubs["on-prem"].resource_group_tags
  virtual_network_name          = local.global_hubs["on-prem"].virtual_network_name
  virtual_network_address_space = local.global_hubs["on-prem"].virtual_network_address_space
  dns_servers                   = local.global_hubs["on-prem"].dns_servers
  subnets                       = local.global_hubs["on-prem"].subnets
  route_table                   = local.global_hubs["on-prem"].route_table

  providers = {
    azurerm = azurerm.on-prem
  }
}

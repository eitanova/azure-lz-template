module "hub-internet-prd" {
  source = "../modules/hub-vnet"

  resource_group_name           = var.hubs["internet-prd"].resource_group_name
  resource_group_location       = var.hubs["internet-prd"].resource_group_location
  resource_group_tags           = var.hubs["internet-prd"].resource_group_tags
  virtual_network_name          = var.hubs["internet-prd"].virtual_network_name
  virtual_network_address_space = var.hubs["internet-prd"].virtual_network_address_space
  dns_servers                   = var.hubs["internet-prd"].dns_servers
  subnets                       = var.hubs["internet-prd"].subnets
  route_table                   = var.hubs["internet-prd"].route_table

  providers = {
    azurerm = azurerm.internet-prd
  }
}

module "hub-internet-dev" {
  source = "../modules/hub-vnet"

  resource_group_name           = var.hubs["internet-dev"].resource_group_name
  resource_group_location       = var.hubs["internet-dev"].resource_group_location
  resource_group_tags           = var.hubs["internet-dev"].resource_group_tags
  virtual_network_name          = var.hubs["internet-dev"].virtual_network_name
  virtual_network_address_space = var.hubs["internet-dev"].virtual_network_address_space
  dns_servers                   = var.hubs["internet-dev"].dns_servers
  subnets                       = var.hubs["internet-dev"].subnets
  route_table                   = var.hubs["internet-dev"].route_table

  providers = {
    azurerm = azurerm.internet-dev
  }
}

module "hub-mgmt" {
  source = "../modules/hub-vnet"

  resource_group_name           = var.hubs["mgmt"].resource_group_name
  resource_group_location       = var.hubs["mgmt"].resource_group_location
  resource_group_tags           = var.hubs["mgmt"].resource_group_tags
  virtual_network_name          = var.hubs["mgmt"].virtual_network_name
  virtual_network_address_space = var.hubs["mgmt"].virtual_network_address_space
  dns_servers                   = var.hubs["mgmt"].dns_servers
  subnets                       = var.hubs["mgmt"].subnets
  route_table                   = var.hubs["mgmt"].route_table

  providers = {
    azurerm = azurerm.mgmt
  }
}

module "hub-on-prem" {
  source = "../modules/hub-vnet"

  resource_group_name           = var.hubs["on-prem"].resource_group_name
  resource_group_location       = var.hubs["on-prem"].resource_group_location
  resource_group_tags           = var.hubs["on-prem"].resource_group_tags
  virtual_network_name          = var.hubs["on-prem"].virtual_network_name
  virtual_network_address_space = var.hubs["on-prem"].virtual_network_address_space
  dns_servers                   = var.hubs["on-prem"].dns_servers
  subnets                       = var.hubs["on-prem"].subnets
  route_table                   = var.hubs["on-prem"].route_table

  providers = {
    azurerm = azurerm.on-prem
  }
}

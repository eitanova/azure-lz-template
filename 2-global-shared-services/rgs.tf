module "internet_prd_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["internet-prd"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["internet-prd"].resource_group_tags

  providers = {
    azurerm = azurerm.internet-prd
  }
}

module "internet_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["internet-dev"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["internet-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.internet-dev
  }
}

module "trusted_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["trusted-dev"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["trusted-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.trusted-dev
  }
}

module "untrusted_dev_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["untrusted-dev"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["untrusted-dev"].resource_group_tags

  providers = {
    azurerm = azurerm.untrusted-dev
  }
}

module "mgmt_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["mgmt"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["mgmt"].resource_group_tags

  providers = {
    azurerm = azurerm.mgmt
  }
}

module "on_prem_rg" {
  source = "../modules/resource-group"

  name     = local.global_hubs["on-prem"].resource_group_name
  location = var.tenant.location
  tags     = local.global_hubs["on-prem"].resource_group_tags

  providers = {
    azurerm = azurerm.on-prem
  }
}

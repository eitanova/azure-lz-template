module "trusted_dev_firewall" {
  source = "../modules/hub-firewall"

  firewall_config = {
    name                        = "fw-trusted-dev"
    sku_name                    = "AZFW_VNet"
    sku_tier                    = "Standard"
    public_ip_allocation_method = "Static"
    public_ip_sku               = "Standard"
    zones                       = ["1", "2", "3"]
    subnet_address_prefix       = "10.112.1.0/26"
    tags                        = local.global_hubs["trusted-dev"].resource_group_tags
  }

  resource_group_name     = local.global_hubs["trusted-dev"].resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.global_hubs["trusted-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.trusted-dev
  }

  depends_on = [module.trusted_dev_hub]
}

module "untrusted_dev_firewall" {
  source = "../modules/hub-firewall"

  firewall_config = {
    name                        = "fw-untrusted-dev"
    sku_name                    = "AZFW_VNet"
    sku_tier                    = "Standard"
    public_ip_allocation_method = "Static"
    public_ip_sku               = "Standard"
    zones                       = ["1", "2", "3"]
    subnet_address_prefix       = "10.112.2.0/26"
    tags                        = local.global_hubs["untrusted-dev"].resource_group_tags
  }

  resource_group_name     = local.global_hubs["untrusted-dev"].resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.global_hubs["untrusted-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-dev
  }

  depends_on = [module.untrusted_dev_hub]
}
module "internet_dev_firewall" {
  source = "../modules/hub-firewall"

  firewall_config = {
    name                        = "fw-internet-dev"
    sku_name                    = "AZFW_VNet"
    sku_tier                    = "Standard"
    public_ip_allocation_method = "Static"
    public_ip_sku               = "Standard"
    zones                       = ["1", "2", "3"]
    subnet_address_prefix       = "10.112.0.64/26"
    tags                        = local.global_hubs["internet-dev"].resource_group_tags
  }

  resource_group_name     = local.global_hubs["internet-dev"].resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.global_hubs["internet-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.internet-dev
  }

  depends_on = [module.internet_dev_hub]
}
module "internet_prd_firewall" {
  source = "../modules/hub-firewall"

  firewall_config = {
    name                        = "fw-internet-prd"
    sku_name                    = "AZFW_VNet"
    sku_tier                    = "Standard"
    public_ip_allocation_method = "Static"
    public_ip_sku               = "Standard"
    zones                       = ["1", "2", "3"]
    subnet_address_prefix       = "10.112.4.64/26"
    tags                        = local.global_hubs["internet-prd"].resource_group_tags
  }

  resource_group_name     = local.global_hubs["internet-prd"].resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.global_hubs["internet-prd"].virtual_network_name

  providers = {
    azurerm = azurerm.internet-prd
  }

  depends_on = [module.internet_prd_hub]
}
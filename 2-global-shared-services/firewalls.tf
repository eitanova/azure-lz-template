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
  resource_group_location = local.global_hubs["trusted-dev"].resource_group_location
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
  resource_group_location = local.global_hubs["untrusted-dev"].resource_group_location
  virtual_network_name    = local.global_hubs["untrusted-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-dev
  }

  depends_on = [module.untrusted_dev_hub]
} 

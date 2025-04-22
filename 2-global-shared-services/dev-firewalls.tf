module "division-trusted-prod-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.global_hubs["trusted-dev"].firewall_config
  resource_group_name     = local.global_hubs["trusted-dev"].resource_group_name
  resource_group_location = local.global_hubs["trusted-dev"].resource_group_location
  virtual_network_name    = local.global_hubs["trusted-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.trusted-dev
  }

  depends_on = [module.trusted-dev-hub]
}

module "division-untrusted-prod-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.global_hubs["untrusted-dev"].firewall_config
  resource_group_name     = local.global_hubs["untrusted-dev"].resource_group_name
  resource_group_location = local.global_hubs["untrusted-dev"].resource_group_location
  virtual_network_name    = local.ulobal_hubs["untrusted-dev"].virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-dev
  }

  depends_on = [module.untrusted-dev-hub]
}
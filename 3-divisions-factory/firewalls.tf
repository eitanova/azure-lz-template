module "division_trusted_prod_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_prod_hub.firewall_config
  resource_group_name     = local.trusted_prod_hub.resource_group_name
  resource_group_location = local.trusted_prod_hub.resource_group_location
  virtual_network_name    = local.trusted_prod_hub.virtual_network_name

  providers = {
    azurerm = azurerm.current-trusted-prod
  }

  depends_on = [module.division_trusted_prod_hub]
}

module "division_untrusted_prod_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_prod_hub.firewall_config
  resource_group_name     = local.untrusted_prod_hub.resource_group_name
  resource_group_location = local.untrusted_prod_hub.resource_group_location
  virtual_network_name    = local.untrusted_prod_hub.virtual_network_name

  providers = {
    azurerm = azurerm.current-untrusted-prod
  }

  depends_on = [module.division_untrusted_prod_hub]
}

module "division_trusted_ppd_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_ppd_hub.firewall_config
  resource_group_name     = local.trusted_ppd_hub.resource_group_name
  resource_group_location = local.trusted_ppd_hub.resource_group_location
  virtual_network_name    = local.trusted_ppd_hub.virtual_network_name

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }

  depends_on = [module.division_trusted_ppd_hub]
}

module "division_untrusted_ppd_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_ppd_hub.firewall_config
  resource_group_name     = local.untrusted_ppd_hub.resource_group_name
  resource_group_location = local.untrusted_ppd_hub.resource_group_location
  virtual_network_name    = local.untrusted_ppd_hub.virtual_network_name

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }

  depends_on = [module.division_untrusted_ppd_hub]
}

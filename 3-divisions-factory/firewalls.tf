module "trusted_prod_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_prod_hub.firewall_config
  resource_group_name     = local.trusted_prod_hub.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.trusted_prod_hub.virtual_network_name

  providers = {
    azurerm = azurerm.trusted-prd
  }

  depends_on = [module.division_trusted_prod_hub]
}

module "untrusted_prod_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_prod_hub.firewall_config
  resource_group_name     = local.untrusted_prod_hub.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.untrusted_prod_hub.virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-prd
  }

  depends_on = [module.division_untrusted_prod_hub]
}

module "trusted_ppd_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_ppd_hub.firewall_config
  resource_group_name     = local.trusted_ppd_hub.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.trusted_ppd_hub.virtual_network_name

  providers = {
    azurerm = azurerm.trusted-ppd
  }

  depends_on = [module.division_trusted_ppd_hub]
}

module "untrusted_ppd_firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_ppd_hub.firewall_config
  resource_group_name     = local.untrusted_ppd_hub.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = local.untrusted_ppd_hub.virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-ppd
  }

  depends_on = [module.division_untrusted_ppd_hub]
}

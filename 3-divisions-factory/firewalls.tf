module "division-trusted-prod-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_prod_hubs[var.division_name].firewall_config
  resource_group_name     = local.trusted_prod_hubs[var.division_name].resource_group_name
  resource_group_location = local.trusted_prod_hubs[var.division_name].resource_group_location
  virtual_network_name    = local.trusted_prod_hubs[var.division_name].virtual_network_name

  providers = {
    azurerm = azurerm.current-trusted-prod
  }

  depends_on = [module.division-trusted-prod-hub]
}

module "division-untrusted-prod-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_prod_hubs[var.division_name].firewall_config
  resource_group_name     = local.untrusted_prod_hubs[var.division_name].resource_group_name
  resource_group_location = local.untrusted_prod_hubs[var.division_name].resource_group_location
  virtual_network_name    = local.untrusted_prod_hubs[var.division_name].virtual_network_name

  providers = {
    azurerm = azurerm.current-untrusted-prod
  }

  depends_on = [module.division-untrusted-prod-hub]
}

module "division-trusted-ppd-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.trusted_ppd_hubs[var.division_name].firewall_config
  resource_group_name     = local.trusted_ppd_hubs[var.division_name].resource_group_name
  resource_group_location = local.trusted_ppd_hubs[var.division_name].resource_group_location
  virtual_network_name    = local.trusted_ppd_hubs[var.division_name].virtual_network_name

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }

  depends_on = [module.division-trusted-ppd-hub]
}

module "division-untrusted-ppd-firewall" {
  source = "../modules/hub-firewall"

  firewall_config         = local.untrusted_ppd_hubs[var.division_name].firewall_config
  resource_group_name     = local.untrusted_ppd_hubs[var.division_name].resource_group_name
  resource_group_location = local.untrusted_ppd_hubs[var.division_name].resource_group_location
  virtual_network_name    = local.untrusted_ppd_hubs[var.division_name].virtual_network_name

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }

  depends_on = [module.division-untrusted-ppd-hub]
}

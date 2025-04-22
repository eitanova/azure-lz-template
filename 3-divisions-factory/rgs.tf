module "division-trusted-prod-rg" {
  source = "../modules/resource-group"

  name     = local.trusted_prod_hubs[var.division_name].resource_group_name
  location = local.trusted_prod_hubs[var.division_name].resource_group_location
  tags     = local.trusted_prod_hubs[var.division_name].resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-prod
  }
}

module "division-untrusted-prod-rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_prod_hubs[var.division_name].resource_group_name
  location = local.untrusted_prod_hubs[var.division_name].resource_group_location
  tags     = local.untrusted_prod_hubs[var.division_name].resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-prod
  }
}

module "division-trusted-ppd-rg" {
  source = "../modules/resource-group"

  name     = local.trusted_ppd_hubs[var.division_name].resource_group_name
  location = local.trusted_ppd_hubs[var.division_name].resource_group_location
  tags     = local.trusted_ppd_hubs[var.division_name].resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }
}

module "division-untrusted-ppd-rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_ppd_hubs[var.division_name].resource_group_name
  location = local.untrusted_ppd_hubs[var.division_name].resource_group_location
  tags     = local.untrusted_ppd_hubs[var.division_name].resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }
}

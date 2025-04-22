module "division_trusted_prod_rg" {
  source = "../modules/resource-group"

  name     = local.trusted_prod_hub.resource_group_name
  location = local.trusted_prod_hub.resource_group_location
  tags     = local.trusted_prod_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-prod
  }
}

module "division_untrusted_prod_rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_prod_hub.resource_group_name
  location = local.untrusted_prod_hub.resource_group_location
  tags     = local.untrusted_prod_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-prod
  }
}

module "division_trusted_ppd_rg" {
  source = "../modules/resource-group"

  name     = local.trusted_ppd_hub.resource_group_name
  location = local.trusted_ppd_hub.resource_group_location
  tags     = local.trusted_ppd_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }
}

module "division_untrusted_ppd_rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_ppd_hub.resource_group_name
  location = local.untrusted_ppd_hub.resource_group_location
  tags     = local.untrusted_ppd_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }
}

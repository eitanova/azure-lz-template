module "division_trusted_prod_rg" {
  source = "../modules/resource-group"

  name     = local.trusted_prod_hub.resource_group_name
  location = var.tenant.location
  tags     = local.trusted_prod_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-prd
  }
}

module "division_untrusted_prod_rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_prod_hub.resource_group_name
  location = var.tenant.location
  tags     = local.untrusted_prod_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-prd
  }
}

module "division_trusted_ppd_rg" {
  source = "../modules/resource-group"

  name     = local.trusted_ppd_hub.resource_group_name
  location = var.tenant.location
  tags     = local.trusted_ppd_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-trusted-ppd
  }
}

module "division_untrusted_ppd_rg" {
  source = "../modules/resource-group"

  name     = local.untrusted_ppd_hub.resource_group_name
  location = var.tenant.location
  tags     = local.untrusted_ppd_hub.resource_group_tags

  providers = {
    azurerm = azurerm.current-untrusted-ppd
  }
}

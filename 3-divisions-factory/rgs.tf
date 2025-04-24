# Trusted Production Resource Groups
module "division_trusted_prod_rgs" {
  for_each = { for idx, hub in local.trusted_prod_hubs : hub.name => hub }

  source = "../modules/resource-group"

  name     = each.value.resource_group_name
  location = var.tenant.location
  tags     = each.value.resource_group_tags

  providers = {
    azurerm = azurerm.trusted-prd
  }
}

# Untrusted Production Resource Groups
module "division_untrusted_prod_rgs" {
  for_each = { for idx, hub in local.untrusted_prod_hubs : hub.name => hub }

  source = "../modules/resource-group"

  name     = each.value.resource_group_name
  location = var.tenant.location
  tags     = each.value.resource_group_tags

  providers = {
    azurerm = azurerm.untrusted-prd
  }
}

# Trusted PPD Resource Groups
module "division_trusted_ppd_rgs" {
  for_each = { for idx, hub in local.trusted_ppd_hubs : hub.name => hub }

  source = "../modules/resource-group"

  name     = each.value.resource_group_name
  location = var.tenant.location
  tags     = each.value.resource_group_tags

  providers = {
    azurerm = azurerm.trusted-ppd
  }
}

# Untrusted PPD Resource Groups
module "division_untrusted_ppd_rgs" {
  for_each = { for idx, hub in local.untrusted_ppd_hubs : hub.name => hub }

  source = "../modules/resource-group"

  name     = each.value.resource_group_name
  location = var.tenant.location
  tags     = each.value.resource_group_tags

  providers = {
    azurerm = azurerm.untrusted-ppd
  }
}

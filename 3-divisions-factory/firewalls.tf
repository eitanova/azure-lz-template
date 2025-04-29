# Trusted Production Firewalls
module "trusted_prod_firewalls" {
  for_each = { for idx, hub in local.trusted_prod_hubs : hub.name => hub }

  source = "../modules/hub-firewall"

  firewall_config         = each.value.firewall_config
  resource_group_name     = each.value.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = each.value.virtual_network_name

  providers = {
    azurerm = azurerm.trusted-prd
  }

  depends_on = [
    module.division_trusted_prod_rgs,
    module.division_trusted_prod_hubs
  ]
}

# Untrusted Production Firewalls
module "untrusted_prod_firewalls" {
  for_each = { for idx, hub in local.untrusted_prod_hubs : hub.name => hub }

  source = "../modules/hub-firewall"

  firewall_config         = each.value.firewall_config
  resource_group_name     = each.value.resource_group_name
  resource_group_location = var.tenant.location
  virtual_network_name    = each.value.virtual_network_name

  providers = {
    azurerm = azurerm.untrusted-prd
  }

  depends_on = [
    module.division_untrusted_prod_rgs,
    module.division_untrusted_prod_hubs
  ]
}

# Trusted PPD Firewalls
# module "trusted_ppd_firewalls" {
#   for_each = { for idx, hub in local.trusted_ppd_hubs : hub.name => hub }

#   source = "../modules/hub-firewall"

#   firewall_config         = each.value.firewall_config
#   resource_group_name     = each.value.resource_group_name
#   resource_group_location = var.tenant.location
#   virtual_network_name    = each.value.virtual_network_name

#   providers = {
#     azurerm = azurerm.trusted-ppd
#   }

#   depends_on = [
#     module.division_trusted_ppd_rgs,
#     module.division_trusted_ppd_hubs
#   ]
# }

# # Untrusted PPD Firewalls
# module "untrusted_ppd_firewalls" {
#   for_each = { for idx, hub in local.untrusted_ppd_hubs : hub.name => hub }

#   source = "../modules/hub-firewall"

#   firewall_config         = each.value.firewall_config
#   resource_group_name     = each.value.resource_group_name
#   resource_group_location = var.tenant.location
#   virtual_network_name    = each.value.virtual_network_name

#   providers = {
#     azurerm = azurerm.untrusted-ppd
#   }

#   depends_on = [
#     module.division_untrusted_ppd_rgs,
#     module.division_untrusted_ppd_hubs
#   ]
# }

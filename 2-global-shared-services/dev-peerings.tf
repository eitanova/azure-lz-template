resource "azurerm_virtual_network_peering" "untrusted_dev_to_dev_internet" {
  name                         = "${local.global_hubs["untrusted-dev"].virtual_network_name}-to-internet"
  resource_group_name          = local.global_hubs["untrusted-dev"].resource_group_name
  virtual_network_name         = local.global_hubs["untrusted-dev"].virtual_network_name
  remote_virtual_network_id    = module.internet_dev_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.untrusted_dev_hub]
}

resource "azurerm_virtual_network_peering" "dev_internet_to_untrusted_dev" {
  name                         = "internet-to-${local.global_hubs["untrusted-dev"].virtual_network_name}"
  resource_group_name          = local.global_hubs["internet-dev"].resource_group_name
  virtual_network_name         = local.global_hubs["internet-dev"].virtual_network_name
  remote_virtual_network_id    = module.untrusted_dev_hub.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = false # set this to true after creating the hub vnet gateway

  depends_on = [module.internet_dev_hub]

  provider = azurerm.internet-dev
}

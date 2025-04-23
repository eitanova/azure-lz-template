module "untrusted_dev_internet_peering" {
  source = "../modules/peering"

  source_peering = {
    name                         = "${local.global_hubs["untrusted-dev"].virtual_network_name}-to-internet"
    resource_group_name          = local.global_hubs["untrusted-dev"].resource_group_name
    virtual_network_name         = local.global_hubs["untrusted-dev"].virtual_network_name
    remote_virtual_network_id    = module.internet_dev_hub.id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  target_peering = {
    name                         = "internet-to-${local.global_hubs["untrusted-dev"].virtual_network_name}"
    resource_group_name          = local.global_hubs["internet-dev"].resource_group_name
    virtual_network_name         = local.global_hubs["internet-dev"].virtual_network_name
    remote_virtual_network_id    = module.untrusted_dev_hub.id
    allow_virtual_network_access = true
    allow_forwarded_traffic      = true
    allow_gateway_transit        = false
    use_remote_gateways          = false
  }

  providers = {
    azurerm.source = azurerm.untrusted-dev
    azurerm.target = azurerm.internet-dev
  }

  depends_on = [
    module.untrusted_dev_hub,
    module.internet_dev_hub
  ]
}

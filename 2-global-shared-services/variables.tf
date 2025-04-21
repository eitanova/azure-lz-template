variable "hubs" {
  description = <<EOT
A map of hub configurations. Each key is a hub name (e.g., "dev-hub", "prod-hub").

Example:
{
  "dev-hub" = {
    resource_group_name           = "rg-dev-hub"
    resource_group_location       = "eastus"
    resource_group_tags           = { env = "dev", team = "network" }

    virtual_network_name          = "vnet-dev-hub"
    virtual_network_address_space = "10.10.0.0/16"
    dns_servers                   = ["10.0.0.4", "10.0.0.5"]

    subnets = {
      "AppSubnet"           = "10.10.1.0/24"
      "GatewaySubnet"       = "10.10.254.0/27"
    }

    route_table = {
      name                   = "udr-dev"
      route_name             = "default-route"
      destination_prefix     = "0.0.0.0/0"
      next_hop_type          = "VirtualAppliance"
      next_hop_ip            = "10.10.1.4"
    }

    firewall = {
      name                        = "fw-dev"
      sku_name                    = "AZFW_VNet"
      sku_tier                    = "Standard"
      ip_configuration_name       = "fw-ipconfig"
      public_ip_allocation_method = "Static"
      public_ip_sku               = "Standard"
      zones                       = ["1", "2", "3"]
      subnet_address_prefix       = "10.10.100.0/26"
      tags                        = { role = "firewall" }
    }
  }
}
EOT

  type = map(object({
    resource_group_name           = string
    resource_group_location       = string
    resource_group_tags           = map(string)
    virtual_network_name          = string
    virtual_network_address_space = string
    dns_servers                   = list(string)
    subnets                       = map(string)

    route_table = object({
      name               = string
      route_name         = string
      destination_prefix = string
      next_hop_type      = string
      next_hop_ip        = string
    })

    firewall = optional(object({
      name                        = string
      sku_name                    = string
      sku_tier                    = string
      ip_configuration_name       = string
      public_ip_allocation_method = string
      public_ip_sku               = string
      zones                       = list(string)
      subnet_address_prefix       = string
      tags                        = map(string)
    }))
  }))
}

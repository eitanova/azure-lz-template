variable "firewall_config" {
  description = <<EOT
Configuration for the Azure Firewall and its associated resources.
{
  name                        = string               # Name of the firewall
  sku_name                    = string               # SKU name (e.g. AZFW_VNet)
  sku_tier                    = string               # SKU tier (Standard, Premium)
  ip_configuration_name       = string               # Name for the IP configuration block
  public_ip_allocation_method = string               # "Static" or "Dynamic"
  public_ip_sku               = string               # Public IP SKU (usually "Standard")
  zones                       = list(string)         # Availability zones (["1", "2", "3"])
  subnet_address_prefix       = string               # CIDR for the AzureFirewallSubnet
  tags                        = map(string)          # Optional resource tags
}
EOT

  type = object({
    name                        = string
    sku_name                    = string
    sku_tier                    = string
    ip_configuration_name       = string
    public_ip_allocation_method = string
    public_ip_sku               = string
    zones                       = list(string)
    subnet_address_prefix       = string
    tags                        = map(string)
  })
}

variable "resource_group_name" {
  description = "The name of the resource group where the virtual network and related resources will be created."
  type        = string
}

variable "resource_group_location" {
  description = "Azure region where the resource group and all resources will be deployed."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Azure Virtual Network to be created."
  type        = string
}

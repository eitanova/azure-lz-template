variable "firewall_config" {
  description = "Configuration for the Azure Firewall"
  type = object({
    name                        = string
    sku_name                    = string
    sku_tier                    = string
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

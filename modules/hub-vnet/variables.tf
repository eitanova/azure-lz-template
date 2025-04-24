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

variable "virtual_network_address_space" {
  description = "The address space (CIDR block) of the virtual network."
  type        = string
}

variable "dns_servers" {
  description = "A list of custom DNS server IP addresses for the virtual network. Leave empty to use Azure's default."
  type        = list(string)
}

variable "subnets" {
  description = <<EOT
A map of subnets to create in the virtual network.
Key = subnet name
Value = address prefix (CIDR block)

Example:
{
  "AppSubnet"         = "10.0.1.0/24",
  "AzureFirewallSubnet" = "10.0.2.0/24"
}
EOT

  type = map(string)
}

variable "route_tables" {
  type = map(object({
    route_name         = string
    destination_prefix = string
    next_hop_type      = string
    next_hop_ip        = string
  }))
}

variable "subnet_route_table_map" {
  type        = map(string)
  description = "Map of subnet names to route table names. If a subnet is not in this map, it won't get a route table association."
}

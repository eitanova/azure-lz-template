resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_virtual_network_dns_servers" "this" {
  count              = length(var.dns_servers) > 0 ? 1 : 0
  virtual_network_id = azurerm_virtual_network.this.id
  dns_servers        = var.dns_servers
}

resource "azurerm_subnet" "this" {
  for_each             = var.subnets
  name                 = each.key
  address_prefixes     = [each.value]
  virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_route_table" "this" {
  for_each = var.route_tables

  name                = each.key
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  route {
    name                   = each.value.route_name
    address_prefix         = each.value.destination_prefix
    next_hop_type          = each.value.next_hop_type
    next_hop_in_ip_address = each.value.next_hop_ip
  }
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = {
    for subnet_name, route_table_name in var.subnet_route_table_map : subnet_name => route_table_name
    if contains(keys(var.subnets), subnet_name) &&
    subnet_name != "AzureFirewallSubnet" &&
    subnet_name != "GatewaySubnet" &&
    subnet_name != "PaloAltoSubnet" &&
    contains(keys(var.route_tables), route_table_name)
  }

  subnet_id      = azurerm_subnet.this[each.key].id
  route_table_id = azurerm_route_table.this[each.value].id
}

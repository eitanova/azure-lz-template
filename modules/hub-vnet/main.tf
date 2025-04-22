resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  address_space       = [var.virtual_network_address_space]
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

resource "azurerm_virtual_network_dns_servers" "this" {
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
  name                = var.route_table.route_table_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name

  route {
    name                   = var.route_table.route_name
    address_prefix         = var.route_table.route_destination_prefix
    next_hop_type          = var.route_table.route_next_hop_type
    next_hop_in_ip_address = var.route_table.route_next_hop_ip
  }
}

resource "azurerm_subnet_route_table_association" "this" {
  for_each = {
    for name, cidr in var.subnets : name => cidr
    if name != "AzureFirewallSubnet" && name != "GatewaySubnet" && name != "PaloAltoSubnet"
  }

  subnet_id      = azurerm_subnet.this[each.key].id
  route_table_id = azurerm_route_table.this.id
}

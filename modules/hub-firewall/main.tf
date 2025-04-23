resource "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = [var.firewall_config.subnet_address_prefix]
}

resource "azurerm_public_ip" "firewall_public_ip" {
  name                = "${var.firewall_config.name}-pip"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.firewall_config.public_ip_allocation_method
  sku                 = var.firewall_config.public_ip_sku
  zones               = var.firewall_config.zones
  tags                = var.firewall_config.tags
}

resource "azurerm_firewall" "firewall" {
  name                = var.firewall_config.name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  sku_name            = var.firewall_config.sku_name
  sku_tier            = var.firewall_config.sku_tier
  zones               = var.firewall_config.zones
  tags                = var.firewall_config.tags

  ip_configuration {
    name                 = "${var.firewall_config.name}-ipconfig"
    subnet_id            = azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_public_ip.id
  }
}

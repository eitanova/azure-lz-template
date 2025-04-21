resource "azurerm_subnet" "this" {
  name                 = "AzureFirewallSubnet"
  address_prefixes     = [var.firewall_config.subnet_address_prefix]
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

resource "azurerm_public_ip" "this" {
  name                = lower("${var.firewall_config.name}-pip")
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = var.firewall_config.public_ip_allocation_method
  sku                 = var.firewall_config.public_ip_sku
  zones               = var.firewall_config.zones
  tags = merge(
    { ResourceName = lower("${var.firewall_config.name}-pip") },
    var.firewall_config.tags
  )
}

resource "azurerm_firewall" "this" {
  name                = var.firewall_config.name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  sku_name            = var.firewall_config.sku_name
  sku_tier            = var.firewall_config.sku_tier

  ip_configuration {
    name                 = var.firewall_config.ip_configuration_name
    subnet_id            = azurerm_subnet.this.id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

data "azurerm_virtual_network" "vnet" {
  count = var.create ? 0 : 1
  name                = var.name
  resource_group_name = var.parent_resource_group
}

resource "azurerm_virtual_network" "vnet" {
  count = var.create ? 1 : 0
  name                = var.name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.parent_resource_group
  tags                = var.tags
}
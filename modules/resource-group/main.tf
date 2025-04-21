resource "azurerm_resource_group" "rg" {
  name = var.name
  tags = var.tags

  location = var.location
}

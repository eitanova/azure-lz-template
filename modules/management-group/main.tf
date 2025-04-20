resource "azurerm_management_group" "management_group" {
  name                       = var.id
  display_name               = var.display_name
  parent_management_group_id = var.parent_id
}
output "details" {
  value = azurerm_virtual_network.vnet[0]
}
output "subnets" {
  value = azurerm_subnet.subnets
}
output "details" {
  value = azurerm_subscription.subscription 
}
output "rbac" {
  value = azurerm_role_assignment.rbac
}
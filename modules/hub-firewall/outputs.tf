output "firewall_id" {
  description = "The ID of the Azure Firewall"
  value       = azurerm_firewall.firewall.id
}

output "firewall_name" {
  description = "The name of the Azure Firewall"
  value       = azurerm_firewall.firewall.name
}

output "firewall_private_ip" {
  description = "The private IP address of the Azure Firewall"
  value       = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
}

output "firewall_public_ip" {
  description = "The public IP address of the Azure Firewall"
  value       = azurerm_public_ip.firewall_public_ip.ip_address
}

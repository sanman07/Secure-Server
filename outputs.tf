output "bastion_public_ip" {
  description = "Public IP address of the bastion host"
  value       = azurerm_public_ip.bastion.ip_address
}

output "app_vm_private_ip" {
  description = "Private IP address of the application VM"
  value       = azurerm_linux_virtual_machine.app.private_ip_address
}

output "database_fqdn" {
  description = "Fully qualified domain name of the MySQL database"
  value       = azurerm_mysql_flexible_server.main.fqdn
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.main.id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
} 
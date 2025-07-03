# Azure Recovery Services Vault
resource "azurerm_recovery_services_vault" "main" {
  name                = "secure-server-backup-vault"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
  soft_delete_enabled = true
}

# Backup Policy for VMs
resource "azurerm_backup_policy_vm" "main" {
  name                = "secure-server-backup-policy"
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }

  retention_weekly {
    count    = 4
    weekdays = ["Sunday"]
  }

  retention_monthly {
    count    = 12
    weekdays = ["Sunday"]
    weeks    = ["First"]
  }
}

# Backup Protection for VMs
resource "azurerm_backup_protected_vm" "bastion" {
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  source_vm_id        = azurerm_linux_virtual_machine.bastion.id
  backup_policy_id    = azurerm_backup_policy_vm.main.id
}

resource "azurerm_backup_protected_vm" "app" {
  resource_group_name = azurerm_resource_group.main.name
  recovery_vault_name = azurerm_recovery_services_vault.main.name
  source_vm_id        = azurerm_linux_virtual_machine.app.id
  backup_policy_id    = azurerm_backup_policy_vm.main.id
} 
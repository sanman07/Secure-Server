# Azure Key Vault for secrets management
resource "azurerm_key_vault" "main" {
  name                        = "secure-server-kv"
  location                    = var.location
  resource_group_name         = azurerm_resource_group.main.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                   = "standard"

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}

# Get current Azure client configuration
data "azurerm_client_config" "current" {}

# Key Vault Access Policy
resource "azurerm_key_vault_access_policy" "main" {
  key_vault_id = azurerm_key_vault.main.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions = [
    "Get", "List", "Create", "Delete", "Update"
  ]

  secret_permissions = [
    "Get", "List", "Set", "Delete"
  ]

  certificate_permissions = [
    "Get", "List", "Create", "Delete", "Update"
  ]
}

# Store database password in Key Vault
resource "azurerm_key_vault_secret" "db_password" {
  name         = "db-admin-password"
  value        = "MySecurePass123!"
  key_vault_id = azurerm_key_vault.main.id
}

# Azure Security Center (Microsoft Defender for Cloud)
resource "azurerm_security_center_setting" "main" {
  setting_name = "MCAS"
  enabled      = true
}

# The following resources are no longer supported and have been removed:
# resource "azurerm_security_center_advanced_threat_protection" "main" { ... }
# resource "azurerm_security_center_advanced_threat_protection" "app" { ... } 
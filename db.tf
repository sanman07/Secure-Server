resource "azurerm_mysql_flexible_server" "main" {
  name                   = "secure-db-server"
  location               = var.location
  resource_group_name    = azurerm_resource_group.main.name
  administrator_login    = "dbadmin"
  administrator_password = "MySecurePass123!"
  sku_name               = "B_Standard_B1ms"
  version                = "5.7"
  zone                   = "1"
}

resource "azurerm_mysql_flexible_database" "main" {
  name                = "appdb"
  resource_group_name = azurerm_resource_group.main.name
  server_name         = azurerm_mysql_flexible_server.main.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
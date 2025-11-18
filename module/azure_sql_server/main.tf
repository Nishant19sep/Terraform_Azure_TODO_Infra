resource "azurerm_mssql_server" "sqlserver" {
for_each = var.mssql_server
  name                         = each.value.sqlserver_name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.sql-username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.sql-password[each.key].value
}

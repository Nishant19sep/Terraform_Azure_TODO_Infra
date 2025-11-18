


data "azurerm_key_vault" "vault" {
  for_each            = var.mssql_server
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name

}

data "azurerm_key_vault_secret" "sql-username" {
  for_each     = var.mssql_server
  name         = each.value.administrator_login
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}

data "azurerm_key_vault_secret" "sql-password" {
  for_each     = var.mssql_server
  name         = each.value.administrator_login_password
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}
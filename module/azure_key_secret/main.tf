data "azurerm_key_vault" "vault" {
  for_each            = var.secret
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name

}
resource "azurerm_key_vault_secret" "bond007" {
  for_each     = var.secret
  name         = each.value.name
  value        = each.value.value
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}

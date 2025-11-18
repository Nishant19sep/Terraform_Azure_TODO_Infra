data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network
  resource_group_name  = each.value.resource_group_name

}

data "azurerm_public_ip" "pip" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "vault" {
  for_each            = var.vms
  name                = each.value.kv_name
  resource_group_name = each.value.resource_group_name

}

data "azurerm_key_vault_secret" "vm-username" {
  for_each     = var.vms
  name         = each.value.username_secret
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}

data "azurerm_key_vault_secret" "vm-password" {
  for_each     = var.vms
  name         = each.value.password_secret
  key_vault_id = data.azurerm_key_vault.vault[each.key].id
}

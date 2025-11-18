variable "mssql_server" {
  type = map(object({
    sqlserver_name           = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    kv_name                      = string
  }))

}

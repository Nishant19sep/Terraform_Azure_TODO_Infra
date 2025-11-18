variable "sql-db"{
    type = map(object({
  sql-db_name         = string
  sqlserver_name = string
  resource_group_name = string
  #server_id    = string
  collation    = string
  license_type = string
  max_size_gb  = string
  sku_name     = string
  enclave_type = string
    }))

}

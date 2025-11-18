module "resource_group" {
  source = "../../module/azure_resource_group"
  rgs   = var.rgs

}

module "virtual" {
  depends_on      = [module.resource_group]
  source          = "../../module/azure_networking"
  virtual_network = var.virtual_network

}

module "public_ip" {
  depends_on = [module.resource_group]
  source     = "../../module/azure_public_ip"
  public_ip  = var.public_ip
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source = "../../module/azure_key_vault"
  key_vaults = var.key_vaults
}

module "secret" {
  depends_on = [ module.key_vault ]
  source = "../../module/azure_key_secret"
  secret = var.secret
  
}


module "vm" {
  depends_on = [ module.virtual, module.secret]
  source = "../../module/azure_compute"
  vms = var.vms
}


module "network_security_group"{
  depends_on = [ module.vm ]
  source = "../../module/azure_network_security"
  nsg = var.nsg
}

module "sql_server" {
  depends_on = [module.secret ]
  source = "../../module/azure_sql_server"
  mssql_server = var.mssql_server
  
}

module "sql-db" {
  depends_on = [ module.sql_server ]
  source = "../../module/azure_sql_database"
 sql-db = var.sql-db
  
}
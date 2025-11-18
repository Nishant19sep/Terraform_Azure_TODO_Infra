variable "rgs" {
  type = map(object({
    name     = string
    location = string
    tags = optional(map(string)


    )

  }))
}

#Below is variable for virtual network
variable "virtual_network" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    subnet = map(object({
      name             = string
      address_prefixes = list(string)
      }
      )
    )

  }))
}

#Below variable is for public Ip

variable "public_ip" {
  type = map(object({
    name                = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    }
  ))
}

# Below variable is for Key Vault

variable "key_vaults" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    }
    )
  )
}

# Below variable is for Secrets

variable "secret" {
  type = map(object({
    name                = string
    value               = string
    kv_name             = string
    resource_group_name = string
    }
    )
  )

}

# Below variable is for NSG creation
variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name            = string
    security_rule = map(object({
      name                   = string
      priority               = number
      direction              = string
      access                 = string
      protocol               = string
      destination_port_range = string
    }))
  }))
}


#Below variable is for VM creation

variable "vms" {
  type = map(object({
    virtual_network     = string
    subnet_name         = string
    nic_name            = string
    location            = string
    resource_group_name = string
    vm_name             = string
    pip_name            = string
    ip_config_name      = string
    username_secret     = string
    password_secret     = string
    size                = string
    kv_name             = string
    # admin_username       = string
    # admin_password      = string
    os_disk = object({
      caching              = string
      storage_account_type = string
    })

    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    }


  ))
}

# Variable for SQL Server:

variable "mssql_server" {
  type = map(object({
    sqlserver_name          = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
    kv_name                      = string
  }))

}

# Variable for SQL-DB
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

# For rg creation
rgs = {
  rg1 = {
    name     = "rg-chintu"
    location = "centralindia"
    tags = {
      managed_by = "India"
      owner      = "nishant"
    }

  }
  rg2 = {
    name     = "rg-beni"
    location = "CentralIndia"

  }
}

# For virtualnetwork creation
virtual_network = {
  vnet_1 = {
    name                = "nt-vnet"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    address_space       = ["10.0.0.0/16"]

    subnet = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }

    }
  }
}

#For Public IP Creation
public_ip = {
  pip1 = {
    name                = "pip-nt"
    resource_group_name = "rg-chintu"
    location            = "centralindia"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "pip-nt1"
    resource_group_name = "rg-chintu"
    location            = "centralindia"
    allocation_method   = "Static"
  }
}

# Input for Key vault creation

key_vaults = {
  kv1 = {
    name                = "nt-kv1-vm1"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
  }
  kv2 = {
    name                = "nt-kv2-vm2"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
  }
  kv3 = {
    name                = "nt-kv1-sql"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
  }
}

# Input for Key secret creation of VM & SQL Server
secret = {
  secret_vm1_un = {
    name                = "frontend-username"
    value               = "ntdevops"
    kv_name             = "nt-kv1-vm1"
    resource_group_name = "rg-chintu"
  }
  secret_vm1_pwd = {
    name                = "frontend-password"
    value               = "Admin@8Dec"
    kv_name             = "nt-kv1-vm1"
    resource_group_name = "rg-chintu"
  }

  secret_vm2_un = {
    name                = "backend-username"
    value               = "ntdevops18"
    kv_name             = "nt-kv2-vm2"
    resource_group_name = "rg-chintu"
  }
  secret_vm2_pwd = {
    name                = "backend-password"
    value               = "Admin@18Dec"
    kv_name             = "nt-kv2-vm2"
    resource_group_name = "rg-chintu"
  }
  secret_sql_un = {
    name                = "sql-username"
    value               = "ntdevops_sql"
    kv_name             = "nt-kv1-sql"
    resource_group_name = "rg-chintu"
  }
  secret_sql_pwd = {
    name                = "sql-password"
    value               = "Admin@18Dec"
    kv_name             = "nt-kv1-sql"
    resource_group_name = "rg-chintu"
  }
}


# Input for NSG rule:

nsg = {
  nsg_vm1 = {
    name                = "nsg-vm1"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    nic_name            = "vm1-nic"
    security_rule = {
      ssh = {
        name                   = "allow-ssh"
        priority               = 100
        direction              = "Inbound"
        access                 = "Allow"
        protocol               = "Tcp"
        destination_port_range = "22"
      }
    }
  }

  nsg_vm2 = {
    name                = "nsg-vm2"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    nic_name            = "vm2-nic"
    security_rule = {
      ssh = {
        name                   = "allow-ssh"
        priority               = 100
        direction              = "Inbound"
        access                 = "Allow"
        protocol               = "Tcp"
        destination_port_range = "22"
      }
    }
  }
}

# Input for VM creation

vms = {
  vm1 = {
    virtual_network     = "nt-vnet"
    subnet_name         = "frontend-subnet"
    nic_name            = "vm1-nic"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    vm_name             = "nt-linux-vm1"
    pip_name            = "pip-nt"
    size                = "Standard_F2"
    username_secret     = "frontend-username"
    password_secret     = "frontend-password"
    kv_name             = "nt-kv1-vm1"
    ip_config_name      = "internal123"


    # admin_username       = "nt19sep"
    # admin_password      = "Nishant@19sep"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    virtual_network     = "nt-vnet"
    subnet_name         = "backend-subnet"
    nic_name            = "vm2-nic"
    location            = "centralindia"
    resource_group_name = "rg-chintu"
    vm_name             = "nt-linux-vm2"
    pip_name            = "pip-nt1"
    size                = "Standard_F2"
    username_secret     = "backend-username"
    password_secret     = "backend-password"
    kv_name             = "nt-kv2-vm2"
    ip_config_name      = "internal456"
    # admin_username       = "nt19sep"
    # admin_password      = "Nishant@19sep"
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

# Input for Sql Server Creation

mssql_server = {
  sql1 = {
    sqlserver_name               = "nt-sql-server"
    resource_group_name          = "rg-chintu"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "sql-username"
    administrator_login_password = "sql-password"
    kv_name                      = "nt-kv1-sql"
  }
}

sql-db = {
  "sql-db1" = {
    sql-db_name         = "nt-sql-db"
  sqlserver_name = "nt-sql-server"
  resource_group_name = "rg-chintu"
  #server_id    = string
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = "2"
  sku_name     = "S0"
  enclave_type = "VBS"
    
  }
}

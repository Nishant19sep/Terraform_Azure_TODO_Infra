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

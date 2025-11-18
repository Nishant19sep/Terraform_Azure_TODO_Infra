variable "nsg" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    nic_name = string
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

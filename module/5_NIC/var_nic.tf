variable "nic_child" {
  type = map(object({
    nic_name    = string
    location    = string
    rg_name     = string
    subnet_name = string
    vnet_name   = string
    pip_name = string
    y = list(object({
        ip_name                       = string
      private_ip_address_allocation = string
    }))
    

    }
  ))
}
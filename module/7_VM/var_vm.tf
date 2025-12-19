variable "vm_child" {
    type = map(object({
      vm_name = string
      rg_name = string
      location = string
      size = string
      admin_username  = string
      admin_password = string
      nic_name = string
    }))
  
}
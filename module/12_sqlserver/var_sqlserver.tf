variable "sqlserver_child" {
    type = map(object({
     sqlserver_name  = string
     rg_name = string
     location = string
     version = string
     administrator_login = string
     administrator_login_password = string
   
    }))
  
}
variable "sqldb_child" {
    type = map(object({
      sqldb_name = string
       collation = string
       license_type = string
       max_size_gb = number
       sku_name = string
       enclave_type = string
       sqlserver_name = string
        rg_name = string 
    }))
  
}
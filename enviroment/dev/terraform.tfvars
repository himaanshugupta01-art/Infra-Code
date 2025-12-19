rg_parent = {
  rg1 = {
    rg_name  = "him-rg"
    location = "central india"
  }
}


nsg_parent = {
  nsg1 = {
    nsg_name = "him-nsg1"
    location = "central india"
    rg_name  = "him-rg"
    tags = {
      enviroment = "dev"
    }
    x = [
      {
        security_name              = "him-security"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
  nsg2 = {
    nsg_name = "him-nsg2"
    location = "central india"
    rg_name  = "him-rg"
    tags = {
      enviroment = "dev"
    }
    x = [
      {
        security_name              = "him-security"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}



vnet_parent = {
  vnet1 = {
    vnet_name     = "him-vnet"
    location      = "central india"
    rg_name       = "him-rg"
    address_space = ["10.0.0.0/16"]
  }
}

subnet_parent = {
  subnet1 = {
    subnet_name      = "him-subnet1"
    rg_name          = "him-rg"
    vnet_name        = "him-vnet"
    address_prefixes = ["10.0.1.0/24"]
  }
  subnet2 = {
    subnet_name      = "him-subnet2"
    rg_name          = "him-rg"
    vnet_name        = "him-vnet"
    address_prefixes = ["10.0.2.0/24"]
  }
}

pip_parent = {
  pip1 = {
    pip_name          = "him-pip1"
    rg_name           = "him-rg"
    location          = "central india"
    allocation_method = "Static"
  }
  pip2 = {
    pip_name          = "him-pip2"
    rg_name           = "him-rg"
    location          = "central india"
    allocation_method = "Static"
  }
}

nic_parent = {
  nic1 = {
    nic_name    = "him-nic1"
    location    = "central india"
    rg_name     = "him-rg"
    subnet_name = "him-subnet1"
    vnet_name   = "him-vnet"
    pip_name    = "him-pip1"
    y = [
      {
        ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"

      }
    ]

  }

  nic2 = {
    nic_name    = "him-nic2"
    location    = "central india"
    rg_name     = "him-rg"
    subnet_name = "him-subnet2"
    vnet_name   = "him-vnet"
    pip_name    = "him-pip2"
    y = [
      {
        ip_name                       = "internal"
        private_ip_address_allocation = "Dynamic"

      }
    ]

  }
}



vm_parent = {
  vm1 = {
    vm_name        = "him-vm1"
    rg_name        = "him-rg"
    location       = "central india"
    size           = "Standard_D2_v3"
    admin_username = "himanshu"
    admin_password = "himanshu@12345"
    nic_name       = "him-nic1"
  }

  vm2 = {
    vm_name        = "him-vm2"
    rg_name        = "him-rg"
    location       = "central india"
    size           = "Standard_D2_v3"
    admin_username = "himanshu"
    admin_password = "himanshu@12345"
    nic_name       = "him-nic2"
  }
}


sqlserver_parent = {
  sqlserver1 = {
    sqlserver_name               = "him-sqlserver"
    rg_name                      = "him-rg"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "himanshu"
    administrator_login_password = "Sql@9871065430"

  }
}

sqldb_parent = {
  sqldb1 = {
    sqldb_name     = "him-sqldb"
    collation      = "SQL_Latin1_General_CP1_CI_AS"
    license_type   = "LicenseIncluded"
    max_size_gb    = 2
    sku_name       = "S0"
    enclave_type   = "VBS"
    sqlserver_name = "him-sqlserver"
    rg_name        = "him-rg"
  }
}

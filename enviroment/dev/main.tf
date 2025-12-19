module "rg" {
  source   = "../../module/1_RG"
  rg_child = var.rg_parent
}


module "nsg" {
  depends_on = [module.rg]
  source     = "../../module/2_NSG"
  nsg_child  = var.nsg_parent

}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../module/3_VNET"
  vnet_child = var.vnet_parent
}

module "subnet" {
  depends_on   = [module.rg, module.vnet]
  source       = "../../module/4_SUBNET"
  subnet_child = var.subnet_parent
}

module "pip" {
  depends_on = [module.vnet, module.subnet]
  source     = "../../module/6_PIP"
  pip_child  = var.pip_parent

}

module "nic" {
  depends_on = [module.subnet, module.pip]
  source     = "../../module/5_NIC"
  nic_child  = var.nic_parent
}

module "vm" {
  depends_on = [module.pip, module.nic]
  source     = "../../module/7_VM"
  vm_child   = var.vm_parent

}

module "sqlserver" {
  depends_on      = [module.nic, module.pip, module.vm]
  source          = "../../module/12_sqlserver"
  sqlserver_child = var.sqlserver_parent


}


module "sqldb" {
  depends_on  = [module.vm, module.pip, module.nic, module.sqlserver]
  source      = "../../module/11_sqldb"
  sqldb_child = var.sqldb_parent

}
resource "azurerm_network_interface" "nic" {
    for_each = var.nic_child
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  dynamic "ip_configuration" {
    for_each = each.value.y
    content {
    name                          = ip_configuration.value.ip_name
    subnet_id                     = data.azurerm_subnet.subnet_data[each.key].id
    private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    public_ip_address_id    =  data.azurerm_public_ip.pip_data[each.key].id
  }
}
}

data "azurerm_subnet" "subnet_data" {
    for_each = var.nic_child
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_data" {
  for_each = var.nic_child
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}


resource "azurerm_mssql_database" "sqldb" {
    for_each = var.sqldb_child
  name         = each.value.sqldb_name
  server_id    = data.azurerm_mssql_server.sqlserver_data[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = each.value.sku_name
  enclave_type = each.value.enclave_type
  }

data "azurerm_mssql_server" "sqlserver_data" {
  for_each = var.sqldb_child
  name                = each.value.sqlserver_name
  resource_group_name = each.value.rg_name
}
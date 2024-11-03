resource "azurerm_cosmosdb_account" "example" {
  name                = var.cosmosdb_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"
  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    location          = var.location
    failover_priority = 0
  }

  # enable_automatic_failover         = var.enable_automatic_failover
  is_virtual_network_filter_enabled = var.is_virtual_network_filter_enabled
  tags                              = var.tags
}

resource "azurerm_cosmosdb_sql_database" "example" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  account_name        = azurerm_cosmosdb_account.example.name
}

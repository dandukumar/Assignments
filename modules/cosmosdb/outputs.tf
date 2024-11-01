output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.example.name
}

output "cosmosdb_database_name" {
  value = azurerm_cosmosdb_sql_database.example.name
}

output "cosmosdb_container_name" {
  value = azurerm_cosmosdb_sql_container.example.name
}

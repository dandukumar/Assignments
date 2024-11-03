provider "azurerm" {
  features {}
  subscription_id = "0d620ca8-1dd9-473c-a96d-2d33d3ee93f7"
  client_id       = "edf3dfa8-fe70-4bee-ae88-46639d7550c8"
  client_secret   = "Bz18Q~fJVKpCdA~jjyhzeMg8f4.gu~W9H50rudiJ"
  tenant_id       = "4d872a0e-4277-48d4-8324-a409f3277ddf"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  tags                     = var.tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = var.container_access_type
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_primary_connection_string" {
  description = "The primary connection string for the Storage Account"
  value       = azurerm_storage_account.storage_account.primary_connection_string
}

output "storage_container_name" {
  description = "The name of the Storage Container"
  value       = azurerm_storage_container.storage_container.name
}

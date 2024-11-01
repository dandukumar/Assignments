output "resource_group_name_test" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.rg.id
}
output "resource_group_location" {
  description = "the locaton of RG"
  value       = azurerm_resource_group.rg.location
}

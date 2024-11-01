# Resource Group Creation
module "azurerm_rg" {
  source   = "../../modules/resource_group"
  name     = "${var.projectname}-${var.env}-${var.team}-rg"
  location = var.location
  tags = {
    Environment = "Development"
    Project     = "Terraform"
  }

}
# Virtual network creation 
module "vnet" {
  source = "../../modules/Vnet"

  vnet_name           = "my-testvnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.azurerm_rg.resource_group_location
  resource_group_name = module.azurerm_rg.resource_group_name_test
  tags                = { environment = "dev" }

  subnets = [
    {
      name               = "subnet-1"
      address_prefixes   = ["10.0.1.0/24"]
      delegation_service = "Microsoft.Network/virtualNetworks"
    },
    {
      name               = "subnet-2"
      address_prefixes   = ["10.0.2.0/24"]
      delegation_service = "Microsoft.Network/virtualNetworks"
    }
  ]
}
# Azure kubernetes Cluster Creation
module "aks" {
  source                 = "../../modules/AKS"
  cluster_name           = "myAKSCluster"
  location               = module.azurerm_rg.resource_group_location
  resource_group_name    = module.azurerm_rg.resource_group_name_test
  dns_prefix             = "myaks"
  default_node_pool_name = "nodepool"
  node_count             = 2
  vm_size                = "Standard_DS2_v2"
  network_plugin         = "azure"
  tags = {
    Environment = "Dev"
    Project     = "AKSProject"
  }
}
# Blob Storage Creation 
module "blobstorage" {
  source                = "../../modules/blobstorage"
  storage_account_name  = "mystorageaccount"
  resource_group_name   = module.azurerm_rg.resource_group_name_test
  location              = module.azurerm_rg.resource_group_location
  account_tier          = "Standard"
  replication_type      = "LRS"
  container_name        = "mycontainer"
  container_access_type = "private"
  tags = {
    Environment = "Dev"
    Project     = "StorageProject"
  }
}
# module "cosmosdb" {
#   source              = "./modules/cosmosdb"
#   cosmosdb_account    = "example-cosmosdb-account"
#   resource_group_name = "example-resource-group"
#   location            = "East US"
#   database_name       = "example-database"
#   container_name      = "example-container"
#   partition_key_path  = "/myPartitionKey"
#   throughput          = 400
# }


module "cpu_alert" {
  source                 = "../../modules/alerts"
  name                   = "cpu-alert"
  resource_group_name    = module.azurerm_rg.resource_group_name_test
  target_resource_id     = "/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/my-resource-group/providers/Microsoft.Compute/virtualMachines/my-vm"
  metric_name            = "Percentage CPU"
  operator               = "GreaterThan"
  threshold              = 80
  frequency              = 5
  alert_action_group_ids = ["/subscriptions/<SUBSCRIPTION_ID>/resourceGroups/my-resource-group/providers/microsoft.insights/actionGroups/my-action-group"]
}

# Azure Key vault module 

module "key_vault" {
  source                          = "../../modules/key_vault"
  key_vault_name                  = "my-keyvault"
  location                        = "West Europe"
  resource_group_name             = "my-resource-group"
  sku_name                        = "standard"
  tenant_id                       = "your-tenant-id"
  soft_delete_enabled             = true
  purge_protection_enabled        = true
  enabled_for_disk_encryption     = false
  enabled_for_deployment          = true
  enabled_for_template_deployment = true
  default_action                  = "Allow"
  bypass                          = "AzureServices"
  tags = {
    Environment = "Production"
    Project     = "Example"
  }
}

output "key_vault_id" {
  value = module.key_vault.key_vault_id
}

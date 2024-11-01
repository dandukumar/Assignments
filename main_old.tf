provider "azurerm" {
  #features = {}
}


module "resource_group" {
  source   = "./modules/resource_group"
  name     = "example-resource-group"
  location = "East US"
  tags = {
    Environment = "Development"
    Project     = "Terraform"
  }
}

module "vnet" {
  source = "./modules/vnet"

  vnet_name           = "my-testvnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  resource_group_name = "example-resource-group"
  #tags                = { environment = "dev" }

  subnets = [
    {
      name             = "subnet-1"
      address_prefixes = ["10.0.1.0/24"]
      #delegation_service = "Microsoft.Network/virtualNetworks"
    },
    {
      name             = "subnet-2"
      address_prefixes = ["10.0.2.0/24"]
      #delegation_service = "Microsoft.Network/virtualNetworks"
    }
  ]
}

output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_ids" {
  value = module.vnet.subnet_ids
}

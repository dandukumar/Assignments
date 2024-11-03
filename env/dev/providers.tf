terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.7"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "0d620ca8-1dd9-473c-a96d-2d33d3ee93f7"
  client_id       = "edf3dfa8-fe70-4bee-ae88-46639d7550c8"
  client_secret   = "Bz18Q~fJVKpCdA~jjyhzeMg8f4.gu~W9H50rudiJ"
  tenant_id       = "4d872a0e-4277-48d4-8324-a409f3277ddf"
}
terraform {
  backend "azurerm" {
    resource_group_name  = "Manoj"              # Can be passed via `-backend-config=`"resource_group_name=<resource group name>"` in the `init` command.
    storage_account_name = "swamiterraformtest" # Can be passed via `-backend-config=`"storage_account_name=<storage account name>"` in the `init` command.
    container_name       = "tfstate"            # Can be passed via `-backend-config=`"container_name=<container name>"` in the `init` command.
    key                  = "dev.tfstate"        # Can be passed via `-backend-config=`"key=<blob key name>"` in the `init` command.
  }
}

// Main AKS Module
provider "azurerm" {
  features {}
  subscription_id = "0d620ca8-1dd9-473c-a96d-2d33d3ee93f7"
  client_id       = "edf3dfa8-fe70-4bee-ae88-46639d7550c8"
  client_secret   = "Bz18Q~fJVKpCdA~jjyhzeMg8f4.gu~W9H50rudiJ"
  tenant_id       = "4d872a0e-4277-48d4-8324-a409f3277ddf"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = var.default_node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  tags = var.tags
}

output "kube_config" {
  description = "The Kubernetes config file for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "host" {
  description = "AKS cluster endpoint"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

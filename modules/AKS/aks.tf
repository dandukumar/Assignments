// Main AKS Module
provider "azurerm" {
  features {}
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

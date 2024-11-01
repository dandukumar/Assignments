
variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Location of the AKS cluster"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Resource group name for AKS cluster"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "default_node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "nodepool"
}

variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "Size of the virtual machines in the default node pool"
  type        = string
  default     = "Standard_DS2_v2"
}

variable "network_plugin" {
  description = "Network plugin for AKS (either azure or kubenet)"
  type        = string
  default     = "azure"
}

variable "tags" {
  description = "Tags to apply to the AKS resources"
  type        = map(string)
  default     = {}
}

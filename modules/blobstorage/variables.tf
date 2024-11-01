variable "storage_account_name" {
  description = "The name of the storage account. Must be globally unique."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the storage account."
  type        = string
  default     = "East US"
}

variable "account_tier" {
  description = "The performance tier of the storage account."
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "The replication type of the storage account (e.g., LRS, GRS, RAGRS, ZRS)."
  type        = string
  default     = "LRS"
}

variable "container_name" {
  description = "The name of the blob storage container."
  type        = string
}

variable "container_access_type" {
  description = "The access level of the blob container (e.g., private, blob, container)."
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to the storage account."
  type        = map(string)
  default     = {}
}

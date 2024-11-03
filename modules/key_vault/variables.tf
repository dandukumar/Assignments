# modules/key_vault/variables.tf

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "location" {
  description = "The location where the Key Vault will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group in which to create the Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The SKU of the Key Vault."
  type        = string
  default     = "standard"
}

variable "tenant_id" {
  description = "The Tenant ID for the Key Vault."
  type        = string
}

variable "soft_delete_enabled" {
  description = "Whether soft delete is enabled for this Key Vault."
  type        = bool
  default     = true
}

variable "purge_protection_enabled" {
  description = "Whether purge protection is enabled for this Key Vault."
  type        = bool
  default     = true
}

variable "enabled_for_disk_encryption" {
  description = "Whether the Key Vault is enabled for disk encryption."
  type        = bool
  default     = false
}

variable "enabled_for_deployment" {
  description = "Whether the Key Vault is enabled for deployment."
  type        = bool
  default     = false
}

variable "enabled_for_template_deployment" {
  description = "Whether the Key Vault is enabled for template deployment."
  type        = bool
  default     = false
}

variable "default_action" {
  description = "The default action to take in the network ACLs."
  type        = string
  default     = "Allow"
}

variable "bypass" {
  description = "Specifies which traffic can bypass the network rules."
  type        = string
  default     = "AzureServices"
}

variable "tags" {
  description = "Tags for the Key Vault."
  type        = map(string)
  default     = {}
}

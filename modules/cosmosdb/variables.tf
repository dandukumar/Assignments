# modules/cosmosdb/variables.tf

variable "cosmosdb_account_name" {
  description = "The name of the Cosmos DB account."
  type        = string
}

variable "location" {
  description = "Location of the Cosmos DB account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group."
  type        = string
}

variable "consistency_level" {
  description = "The consistency level of the Cosmos DB account."
  type        = string
  default     = "Session"
}

variable "enable_automatic_failover" {
  description = "Enable automatic failover for the Cosmos DB account."
  type        = bool
  default     = false
}

variable "is_virtual_network_filter_enabled" {
  description = "Enables virtual network filter for the Cosmos DB account."
  type        = bool
  default     = false
}

variable "database_name" {
  description = "The name of the SQL database within the Cosmos DB account."
  type        = string
}

variable "tags" {
  description = "Tags for the Cosmos DB account."
  type        = map(string)
  default     = {}
}

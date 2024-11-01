variable "cosmosdb_account" {
  description = "The name of the Cosmos DB account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location where the resources will be created."
  type        = string
}

variable "database_name" {
  description = "The name of the Cosmos DB SQL database."
  type        = string
}

variable "container_name" {
  description = "The name of the Cosmos DB SQL container."
  type        = string
}

variable "partition_key_path" {
  description = "The partition key path for the container."
  type        = string
}

variable "throughput" {
  description = "The throughput for the container."
  type        = number
  default     = 400
}

variable "projectname" {
  description = "The name of the resource group"
  type        = string
  default     = "volvo"
}
variable "env" {
  description = "The name of the resource group"
  type        = string
  default     = "dev"

}
variable "team" {
  description = "The name of the resource group"
  type        = string
  default     = "Europe"
}
variable "location" {
  description = "The location name of RG"
}
variable "name" {
  description = "it describes subnet name"
  default     = "subnet1"
}
variable "node_count" {
  type        = number
  description = "it describes node count"
  default     = 1

}
variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

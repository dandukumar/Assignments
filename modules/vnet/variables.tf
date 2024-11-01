variable "vnet_name" {
  description = "The name of the Virtual Network"
  type        = string
}

variable "address_space" {
  description = "The address space for the Virtual Network"
  type        = list(string)
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}
variable "tags" {
  description = "Tags to be applied to the VNet"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "A list of subnets to create"
  type = list(object({
    name               = string
    address_prefixes    = list(string)
    delegation_service  = string
  }))
}




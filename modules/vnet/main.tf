resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}
resource "azurerm_subnet" "subnet" {
  count = length(var.subnets)
  name  = var.subnets[count.index].name
  #resource_group_name = azurerm_virtual_network.vnet.resource_group_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnets[count.index].address_prefixes

  # # delegation {
  # #   name = "delegation"
  # #   service_delegation {
  # #     name    = var.subnets[count.index].delegation_service
  # #     actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
  # #   }
  # }

  depends_on = [azurerm_virtual_network.vnet]
}

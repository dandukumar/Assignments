provider "azurerm" {
  features {}
  subscription_id = "0d620ca8-1dd9-473c-a96d-2d33d3ee93f7"
  client_id       = "edf3dfa8-fe70-4bee-ae88-46639d7550c8"
  client_secret   = "Bz18Q~fJVKpCdA~jjyhzeMg8f4.gu~W9H50rudiJ"
  tenant_id       = "4d872a0e-4277-48d4-8324-a409f3277ddf"
  }


resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location =  "eastus"
}

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/22"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "main" {
  name                = "${var.prefix}-nic"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "main" {
  name                            = "${var.prefix}-vm"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = "eastus"
  size                            = "Standard_D2s_v3"
  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/my_azure_key.pub")
  }
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    create_option       = "FromImage"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
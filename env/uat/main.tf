module "azurerm_rg" {
  source   = "../../modules/resource_group"
  name     = "${var.projectname}-${var.env}-${var.team}-rg"
  location = "eastus"
  tags = {
    Environment = "Development"
    Project     = "Terraform"
  }

}

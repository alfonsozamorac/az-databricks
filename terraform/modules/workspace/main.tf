provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_databricks_workspace" "workspace" {
  name                = var.databricks_workspace
  resource_group_name = var.resource_group
  location            = var.location
  sku                 = "standard"
  tags                = var.tags
}


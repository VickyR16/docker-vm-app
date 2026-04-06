resource "azurerm_resource_group" "resourceGroup" {
  name = var.resourceGroup_name
  location = var.location
}
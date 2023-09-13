resource "azurerm_resource_group" "example" {
  name     = var.rg_name
  location = var.rg_location
}

# Create virtual network
resource "azurerm_virtual_network" "net1" {
  name                = "vnet1"
  address_space       = ["172.17.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}
# Create AppSN within the virtual network
resource "azurerm_subnet" "appSN" {
  name                 = "AppSN"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.net1.name
  address_prefixes     = ["172.17.10.0/24"]
}

# Create subnet within the virtual network
resource "azurerm_subnet" "workSN" {
  name                 = "WorkSN"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.net1.name
  address_prefixes     = ["172.17.20.0/24"]
}
# Create subnet within the virtual network
resource "azurerm_subnet" "hrSN" {
  name                 = "HrSN"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.net1.name
  address_prefixes     = ["172.17.30.0/24"]
}

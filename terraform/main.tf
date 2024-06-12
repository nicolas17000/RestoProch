provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name                = "mainVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = "mainSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend" {
  source              = "./backend"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "frontend" {
  source              = "./frontend"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "load_balancer" {
  source              = "./load_balancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "supervision" {
  source              = "./supervision"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

module "bdd" {
  source              = "./bdd"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}


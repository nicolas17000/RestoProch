# Ce script Terraform configure un environnement Azure complet, incluant un groupe de ressources, un réseau virtuel, un sous-réseau, 
# et lance plusieurs modules pour différents composants tels que backend, frontend, load balancer, supervision et base de données. 
# Chaque module utilise des variables pour la localisation, le groupe de ressources, le sous-réseau et les informations d'authentification administratives.

# Fournisseur AzureRM
provider "azurerm" {
  features {}
}

# Crée un groupe de ressources Azure
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Crée un réseau virtuel Azure
resource "azurerm_virtual_network" "main" {
  name                = "mainVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Crée un sous-réseau au sein du réseau virtuel
resource "azurerm_subnet" "main" {
  name                 = "mainSubnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Module pour les ressources backend
module "backend" {
  source              = "./backend"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# Module pour les ressources frontend
module "frontend" {
  source              = "./frontend"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# Module pour les ressources de répartition de charge (load balancer)
module "load_balancer" {
  source              = "./load_balancer"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# Module pour les ressources de supervision
module "supervision" {
  source              = "./supervision"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}

# Module pour les ressources de la base de données (BDD)
module "bdd" {
  source              = "./bdd"
  location            = var.location
  resource_group_name = azurerm_resource_group.main.name
  subnet_id           = azurerm_subnet.main.id
  admin_username      = var.admin_username
  admin_password      = var.admin_password
}


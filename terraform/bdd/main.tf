# Crée une ressource d'adresse IP publique nommée "bdd_ip1"
resource "azurerm_public_ip" "bdd_ip1" {
  name                = "bddPublicIP1"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Crée une interface réseau nommée "bdd_nic1" et la lie à l'adresse IP publique "bdd_ip1"
resource "azurerm_network_interface" "bdd_nic1" {
  name                = "bddNIC1"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.bdd_ip1.id
  }
}

# Crée une machine virtuelle nommée "bdd_vm1" et la lie à l'interface réseau "bdd_nic1"
resource "azurerm_virtual_machine" "bdd_vm1" {
  name                  = "bddVM1"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.bdd_nic1.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "bddOsDisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11"
    version   = "latest"
  }

  os_profile {
    computer_name  = "bddvm1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Crée un groupe de sécurité réseau (NSG) nommé "bdd_nsg" avec des règles pour SSH et HTTP
resource "azurerm_network_security_group" "bdd_nsg" {
  name                = "bddNSG"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

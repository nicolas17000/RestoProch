# Crée une ressource d'adresse IP publique nommée "supervision_ip1"
resource "azurerm_public_ip" "supervision_ip1" {
  name                = "supervisionPublicIP1"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Crée une ressource d'adresse IP publique nommée "supervision_ip2"
resource "azurerm_public_ip" "supervision_ip2" {
  name                = "supervisionPublicIP2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
}

# Crée une interface réseau nommée "supervision_nic1" et la lie à l'adresse IP publique "supervision_ip1"
resource "azurerm_network_interface" "supervision_nic1" {
  name                = "supervisionNIC1"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.supervision_ip1.id
  }
}

# Crée une interface réseau nommée "supervision_nic2" et la lie à l'adresse IP publique "supervision_ip2"
resource "azurerm_network_interface" "supervision_nic2" {
  name                = "supervisionNIC2"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.supervision_ip2.id
  }
}

# Crée un groupe de sécurité réseau (NSG) nommé "supervision_nsg" avec des règles pour SSH et HTTP
resource "azurerm_network_security_group" "supervision_nsg" {
  name                = "supervisionNSG"
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

# Crée une machine virtuelle nommée "supervision_vm1" et la lie à l'interface réseau "supervision_nic1"
resource "azurerm_virtual_machine" "supervision_vm1" {
  name                  = "supervisionVM1"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.supervision_nic1.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "supervisionOsDisk1"
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
    computer_name  = "supervisionvm1"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

# Crée une machine virtuelle nommée "supervision_vm2" et la lie à l'interface réseau "supervision_nic2"
resource "azurerm_virtual_machine" "supervision_vm2" {
  name                  = "supervisionVM2"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.supervision_nic2.id]
  vm_size               = "Standard_B1s"

  storage_os_disk {
    name              = "supervisionOsDisk2"
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
    computer_name  = "supervisionvm2"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}

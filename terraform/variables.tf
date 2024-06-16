# Variable pour la région Azure où déployer les ressources
variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "West Europe"
}

# Variable pour le nom du groupe de ressources
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "RestoProchRG"
}

# Variable pour le nom d'utilisateur administrateur des VMs
variable "admin_username" {
  description = "The admin username for VM"
  type        = string
  default     = "adminuser"
}

# Variable pour le mot de passe administrateur des VMs
variable "admin_password" {
  description = "The admin password for VM"
  type        = string
  default     = "MjpqT3gp"
}

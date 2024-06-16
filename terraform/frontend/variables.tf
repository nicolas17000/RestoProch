# Variable pour la région Azure où déployer les ressources
variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

# Variable pour le nom du groupe de ressources
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Variable pour l'ID du sous-réseau pour les VMs
variable "subnet_id" {
  description = "The subnet ID for the VMs"
  type        = string
}

# Variable pour le nom d'utilisateur administrateur des VMs
variable "admin_username" {
  description = "The admin username for VM"
  type        = string
}

# Variable pour le mot de passe administrateur des VMs
variable "admin_password" {
  description = "The admin password for VM"
  type        = string
  default     = "MjpqT3gp"
}

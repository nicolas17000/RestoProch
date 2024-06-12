variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "RestoProchRG"
}

variable "admin_username" {
  description = "The admin username for VM"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for VM"
  type        = string
  default     = "MjpqT3gp"
}

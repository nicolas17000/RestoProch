variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID for the VMs"
  type        = string
}

variable "admin_username" {
  description = "The admin username for VM"
  type        = string
}

variable "admin_password" {
  description = "The admin password for VM"
  type        = string
  default     = "MjpqT3gp"
}

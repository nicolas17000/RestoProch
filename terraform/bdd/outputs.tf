output "bdd_vm_public_ips" {
  value = [azurerm_public_ip.bdd_ip1.ip_address]
}
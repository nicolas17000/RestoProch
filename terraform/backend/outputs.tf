output "backend_vm_public_ips" {
  value = [azurerm_public_ip.backend_ip1.ip_address, azurerm_public_ip.backend_ip2.ip_address]
}

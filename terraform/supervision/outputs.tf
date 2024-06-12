output "supervision_vm_public_ips" {
  value = [azurerm_public_ip.supervision_ip1.ip_address, azurerm_public_ip.supervision_ip2.ip_address]
}

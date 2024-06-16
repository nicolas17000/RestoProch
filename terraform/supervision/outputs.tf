# Définit une sortie pour les adresses IP publiques des machines virtuelles de supervision
output "supervision_vm_public_ips" {
  value = [azurerm_public_ip.supervision_ip1.ip_address, azurerm_public_ip.supervision_ip2.ip_address]
}

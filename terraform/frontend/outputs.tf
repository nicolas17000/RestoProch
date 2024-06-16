# Définit une sortie pour les adresses IP publiques des machines virtuelles frontend
output "frontend_vm_public_ips" {
  value = [azurerm_public_ip.frontend_ip1.ip_address, azurerm_public_ip.frontend_ip2.ip_address]
}

# Définit une sortie pour les adresses IP publiques des machines virtuelles de la base de données
output "bdd_vm_public_ips" {
  value = [azurerm_public_ip.bdd_ip1.ip_address]
}
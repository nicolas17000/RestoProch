# Définit une sortie pour les adresses IP publiques des machines virtuelles de répartition de charge (load balancer)
output "lb_vm_public_ips" {
  value = [azurerm_public_ip.lb_ip1.ip_address, azurerm_public_ip.lb_ip2.ip_address]
}


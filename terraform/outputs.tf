# Ce fichier définit les sorties (outputs) de Terraform, qui incluent les adresses IP publiques des VMs pour les modules backend, frontend, load balancer, supervision et base de données.

# Sortie pour les adresses IP publiques des VMs du module backend
output "backend_ips" {
  value = module.backend.backend_vm_public_ips
}

# Sortie pour les adresses IP publiques des VMs du module frontend
output "frontend_ips" {
  value = module.frontend.frontend_vm_public_ips
}

# Sortie pour les adresses IP publiques des VMs du module load balancer
output "lb_ips" {
  value = module.load_balancer.lb_vm_public_ips
}

# Sortie pour les adresses IP publiques des VMs du module supervision
output "supervision_ips" {
  value = module.supervision.supervision_vm_public_ips
}

# Sortie pour les adresses IP publiques des VMs du module base de données
output "bdd_ips" {
  value = module.bdd.bdd_vm_public_ips
}

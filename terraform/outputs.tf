output "backend_ips" {
  value = module.backend.backend_vm_public_ips
}

output "frontend_ips" {
  value = module.frontend.frontend_vm_public_ips
}
output "lb_ips" {
  value = module.load_balancer.lb_vm_public_ips
}
output "supervision_ips" {
  value = module.supervision.supervision_vm_public_ips
}
output "bdd_ips" {
  value = module.bdd.bdd_vm_public_ips
}

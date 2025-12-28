output "alb_dns_name" {
  value = module.alb.alb_dns
}

output "patient_service" {
  value = module.patient_ecs.service_name
}

output "appointment_service" {
  value = module.appointment_ecs.service_name
}

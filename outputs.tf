output "vpc_id" {
  description = "ID da VPC criada"
  value       = google_compute_network.vpc.id
}

output "private_subnets" {
  description = "IDs das sub-redes privadas"
  value       = { for k, v in google_compute_subnetwork.private : k => v.id }
}

output "public_subnets" {
  description = "IDs das sub-redes públicas"
  value       = { for k, v in google_compute_subnetwork.public : k => v.id }
}

output "database_subnets" {
  description = "IDs das sub-redes de banco de dados"
  value       = { for k, v in google_compute_subnetwork.database : k => v.id }
}

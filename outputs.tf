output "vpc_name" {
  description = "Nome da VPC criada"
  value       = google_compute_network.vpc.name
}

output "private_subnets" {
  description = "IDs das sub-redes privadas"
  value       = [for s in google_compute_subnetwork.private : s.id]
}

output "public_subnets" {
  description = "IDs das sub-redes públicas"
  value       = [for s in google_compute_subnetwork.public : s.id]
}

output "database_subnets" {
  description = "IDs das sub-redes de banco de dados"
  value       = [for s in google_compute_subnetwork.database : s.id]
}

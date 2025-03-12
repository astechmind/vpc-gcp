output "vpc_id" {
  description = "ID da VPC criada"
  value       = google_compute_network.vpc.id
}

output "private_subnets" {
  description = "Lista de subnets privadas (com região e ID)"
  value       = { for k, v in google_compute_subnetwork.private : k => { region = v.region, id = v.id } }
}

output "public_subnets" {
  description = "Lista de subnets públicas (com região e ID)"
  value       = { for k, v in google_compute_subnetwork.public : k => { region = v.region, id = v.id } }
}

output "database_subnets" {
  description = "Lista de subnets de banco de dados (com região e ID)"
  value       = { for k, v in google_compute_subnetwork.database : k => { region = v.region, id = v.id } }
}

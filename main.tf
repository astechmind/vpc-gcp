# Usa uma VPC existente caso existing
data "google_compute_network" "existing_vpc" {
  count = var.use_existing_vpc ? 1 : 0
  name  = var.vpc_name
  project = var.project_id
}

# Criação da VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnets Privadas (com nomes e IP Privado do Google ativado)
resource "google_compute_subnetwork" "private" {
  for_each = var.private_subnets

  name                     = each.key
  ip_cidr_range            = each.value
  region                   = var.region
  project                  = var.project_id
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

# Subnets Públicas
resource "google_compute_subnetwork" "public" {
  for_each = var.public_subnets

  name          = each.key
  ip_cidr_range = each.value
  region        = var.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
}

# Subnets para Banco de Dados
resource "google_compute_subnetwork" "database" {
  for_each = var.database_subnets

  name          = each.key
  ip_cidr_range = each.value
  region        = var.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
}

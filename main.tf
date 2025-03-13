# Criação da VPC
resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnets Privadas
resource "google_compute_subnetwork" "private" {
  for_each = var.private_subnets

  name                     = each.value.name
  ip_cidr_range            = each.value.cidr
  region                   = each.value.region
  project                  = var.project_id
  network                  = google_compute_network.vpc.id
  private_ip_google_access = true
}

# Subnets Públicas
resource "google_compute_subnetwork" "public" {
  for_each = var.public_subnets

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
}

# Subnets para Banco de Dados
resource "google_compute_subnetwork" "database" {
  for_each = var.database_subnets

  name          = each.value.name
  ip_cidr_range = each.value.cidr
  region        = each.value.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
}

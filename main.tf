provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Subnets Privadas
resource "google_compute_subnetwork" "private" {
  for_each = { for idx, cidr in var.private_subnets_cidrs : idx => cidr }

  name          = "${var.vpc_name}-private-${each.key}"
  ip_cidr_range = each.value
  region        = var.region
  network       = google_compute_network.vpc.id
  private_ip_google_access = true
}

# Subnets Públicas
resource "google_compute_subnetwork" "public" {
  for_each = { for idx, cidr in var.public_subnets_cidrs : idx => cidr }

  name          = "${var.vpc_name}-public-${each.key}"
  ip_cidr_range = each.value
  region        = var.region
  network       = google_compute_network.vpc.id
}

# Subnets de Banco de Dados
resource "google_compute_subnetwork" "database" {
  for_each = { for idx, cidr in var.database_subnets_cidrs : idx => cidr }

  name          = "${var.vpc_name}-db-${each.key}"
  ip_cidr_range = each.value
  region        = var.region
  network       = google_compute_network.vpc.id
}

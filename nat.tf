# Criação do Cloud Router
resource "google_compute_router" "router" {
  name    = "nat-router"
  region  = var.region
  network = google_compute_network.vpc.id
  project = var.project_id
}

# Criação do Cloud NAT
resource "google_compute_router_nat" "nat" {
  name                               = "nat-gke"
  router                             = google_compute_router.router.name
  region                             = var.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  project                            = var.project_id
}

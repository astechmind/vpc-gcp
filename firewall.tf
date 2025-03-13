# Regra de Firewall para permitir saída de internet (EGRESS)
resource "google_compute_firewall" "allow-egress" {
  name    = "allow-egress-internet"
  network = google_compute_network.vpc.id
  project = var.project_id

  direction          = "EGRESS"
  priority           = 1000
  destination_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "all"
  }
}

resource "google_compute_network" "vpc" {
  name = var.vpc_name

  # this is default
  # routing_mode = "REGIONAL"

  # this is default
  auto_create_subnetworks = var.vpc_auto_create_subnetworks

  # this is default
  # delete_default_routes_on_create = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_ip_cidr_range
  region        = var.subnet_region
  network       = google_compute_network.vpc.id
}

resource "google_compute_firewall" "firewall" {
  name    = var.firewall_name
  network = google_compute_network.vpc.self_link
  allow {
    protocol = "tcp"
    ports    = [22, 80]
  }
  source_ranges = [
    "0.0.0.0/0"
  ]
}

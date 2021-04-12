resource "google_compute_network" "vpc" {
  name = var.vpc_name

  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = true
  delete_default_routes_on_create = false
}

resource "google_compute_router" "vpc" {
  name    = var.vpc_name
  region  = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "vpc" {
  name   = var.vpc_name
  region = var.region
  router = google_compute_router.vpc.name

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_global_address" "vpc" {
  name = "global_address"

  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.vpc_prefix_length
  network       = google_compute_network.vpc.self_link
}

resource "google_service_networking_connection" "vpc" {
  service = "servicenetworking.googleapis.com"

  reserved_peering_ranges = [
    google_compute_global_address.vpc.name,
  ]

  network = google_compute_network.vpc.self_link
}

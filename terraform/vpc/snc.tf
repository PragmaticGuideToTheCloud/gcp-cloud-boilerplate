resource "google_compute_global_address" "vpc" {
  name = "${var.vpc_name}-global-address"

  purpose      = "VPC_PEERING"
  address_type = "INTERNAL"

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

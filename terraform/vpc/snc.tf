resource "google_compute_global_address" "vpc" {
  name          = "${var.vpc_name}-global-address"
  count         = var.snc_count
  network       = google_compute_network.vpc.self_link
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = var.vpc_prefix_length
}

resource "google_service_networking_connection" "vpc" {
  count   = var.snc_count
  network = google_compute_network.vpc.self_link
  service = "servicenetworking.googleapis.com"

  reserved_peering_ranges = [
    google_compute_global_address.vpc[count.index].name,
  ]
}

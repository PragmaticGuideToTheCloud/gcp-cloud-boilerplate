resource "google_compute_network" "vpc" {
  name = var.vpc_name

  routing_mode = "REGIONAL"

  auto_create_subnetworks = true

  delete_default_routes_on_create = false
}

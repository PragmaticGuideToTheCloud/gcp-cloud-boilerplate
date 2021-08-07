resource "google_compute_network" "vpc" {
  name = var.vpc_name

  # this is default
  # routing_mode = "REGIONAL"

  # this is default
  # auto_create_subnetworks = true

  # this is default
  # delete_default_routes_on_create = false
}

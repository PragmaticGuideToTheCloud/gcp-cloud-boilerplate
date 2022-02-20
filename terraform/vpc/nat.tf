resource "google_compute_router" "vpc" {
  name    = "${var.vpc_name}-router"
  count   = var.nat_count
  region  = var.region
  network = google_compute_network.vpc.self_link
}

resource "google_compute_router_nat" "vpc" {
  name   = "${var.vpc_name}-router-nat"
  count  = var.nat_count
  region = var.region
  router = google_compute_router.vpc[count.index].name

  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  drain_nat_ips = []
  nat_ips = []
}

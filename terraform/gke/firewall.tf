resource "google_compute_firewall" "gke" {
  depends_on = [ data.terraform_remote_state.vpc ]

  name = var.env_name

  network = data.terraform_remote_state.vpc.outputs.vpc_link

  allow {
    protocol = "all"
  }

  target_tags = [ "${var.env_name}-compute" ]
}

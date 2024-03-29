output "vpc_link" {
  value = google_compute_network.vpc.self_link
}

output "vpc_prefix_length" {
  value = var.vpc_prefix_length
}

output "bastion_host" {
  value = var.bastion_count > 0 ? element(google_compute_instance.bastion.*.network_interface.0.access_config.0.nat_ip, 0) : ""
}

output "bastion_user" {
  value = var.bastion_user
}

output "bastion_port" {
  value = var.bastion_port
}

output "wireguard_peer_filename" {
  value = "vpn/${var.project}-${var.vpc_name}.conf"
}

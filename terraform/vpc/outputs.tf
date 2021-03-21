
locals {
  wireguard_peer_filename = "${path.root}/../../../../../../../../vpn/${var.vpc_name}/bastion-${var.project}.conf"
}

output "vpc_link" {
  value = google_compute_network.vpc.self_link
}

output "vpc_prefix_length" {
  value = var.vpc_prefix_length
}

output "bastion_host" {
  value = google_compute_instance.bastion.*.network_interface.0.access_config.0.nat_ip
}

output "bastion_user" {
  value = var.bastion_user
}

output "bastion_port" {
  value = var.bastion_port
}

output "wireguard_peer_filename" {
  value = abspath(local.wireguard_peer_filename)
}

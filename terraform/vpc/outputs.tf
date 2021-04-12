locals {
  wireguard_peer_filename = "vpn/${var.project}-${var.vpc_name}.conf"
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
  value = local.wireguard_peer_filename
}

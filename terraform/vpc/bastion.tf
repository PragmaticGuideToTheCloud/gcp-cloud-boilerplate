
locals {
  bastion_tags = [ "bastion" ]
  playbook_dir = "${path.root}/../../../../../../../../ansible/${var.vpc_name}"
  wireguard_bastion_file = [ "${var.project}-${var.vpc_name}" ]
}

data "google_compute_zones" "vpc" {}

resource "random_id" "bastion-name-suffix" {
  count = var.bastion_count > 0 ? 1 : 0

  byte_length = 4
}

resource "google_compute_instance" "bastion" {
  depends_on = [ data.google_compute_zones.vpc ]

  count = var.bastion_count > 0 ? 1 : 0

  name = "${var.vpc_name}-bastion-${random_id.bastion-name-suffix.*.hex[count.index]}"

  zone = element(
    data.google_compute_zones.vpc.names,
    count.index % length(data.google_compute_zones.vpc.names)
  )

  machine_type = var.bastion_machine_type

  boot_disk {
    initialize_params {
      image = var.bastion_boot_disk_image
    }
  }

  allow_stopping_for_update = true

  network_interface {
    network = google_compute_network.vpc.self_link
    access_config {
      network_tier = "STANDARD"
    }
  }

  metadata = {
    ssh-keys = join(":", [var.bastion_user, file(var.bastion_public_key_filename)])
  }

  tags = local.bastion_tags
}

resource "google_compute_firewall" "bastion" {
  count = var.bastion_count > 0 ? 1 : 0

  name = "${var.vpc_name}-bastion"

  network = google_compute_network.vpc.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = [ var.bastion_port, "80", "443" ]
  }

  allow {
    protocol = "udp"
    ports    = [ var.wireguard_port ]
  }

  target_tags = local.bastion_tags
}

# Prepare ansible inventory file (hosts.ini)
resource "local_file" "bastion" {
  depends_on = [ google_compute_instance.bastion ]

  count = var.bastion_count > 0 ? 1 : 0

  filename = "${local.playbook_dir}/hosts.ini"

  content = templatefile("${local.playbook_dir}/hosts.ini.tpl", {
    WIREGUARD_PEERS = "WIREGUARD_PEERS=${jsonencode(local.wireguard_bastion_file)}"
    TARGET = join(" ", [
      google_compute_instance.bastion.*.name[count.index],
      "ansible_user=${var.bastion_user}",
      "ansible_host=${google_compute_instance.bastion.*.network_interface.0.access_config.0.nat_ip[count.index]}",
      "ansible_port=${var.bastion_port}",
    ])
    PEER_ROUTES = var.peer_routes
  })
}

# Execute ansible/provision-bastion scripts
resource "null_resource" "bastion" {
  depends_on = [
    google_compute_global_address.vpc,
    google_service_networking_connection.vpc,
    google_compute_instance.bastion,
    google_compute_firewall.bastion,
  ]

  count = var.bastion_count > 0 ? 1 : 0

  triggers = {
    always = uuid()
  }

  provisioner "local-exec" {
    environment = {
      PLAYBOOK_DIR = local.playbook_dir
    }
    command = <<-EOF
    $PLAYBOOK_DIR/apply.sh
    EOF
  }
}

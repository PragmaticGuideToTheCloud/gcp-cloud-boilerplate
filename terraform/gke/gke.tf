resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone
  network  = data.terraform_remote_state.vpc.outputs.vpc_link

  remove_default_node_pool = true
  initial_node_count       = 1
  networking_mode          = "VPC_NATIVE"

  datapath_provider     = var.datapath_provider
  enable_shielded_nodes = true

  ip_allocation_policy {}

  private_cluster_config {
    enable_private_endpoint = true
    enable_private_nodes    = true
    master_ipv4_cidr_block  = var.master_ipv4_cidr_block
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.authorized_networks

      content {
        display_name = cidr_blocks.value["display_name"]
        cidr_block   = cidr_blocks.value["cidr_block"]
      }
    }
  }

  workload_identity_config {
    workload_pool = "${var.project}.svc.id.goog"
  }
}

resource "google_container_node_pool" "gke" {
  name     = "${var.cluster_name}-gke-node-pool"
  location = var.zone
  cluster  = google_container_cluster.gke.name

  initial_node_count = var.initial_node_count

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  node_config {
    preemptible  = var.compute_preemptible
    machine_type = var.compute_machine_type
    image_type   = var.compute_image_type
    disk_size_gb = var.compute_disk_size_gb

    oauth_scopes = var.gke_oauth_scopes

    tags = []
  }
}

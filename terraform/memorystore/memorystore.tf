resource "google_redis_instance" "memorystore" {
  name = "${var.env_name}-memorystore"

  region = var.region

  tier               = var.memorystore_tier
  redis_version      = var.memorystore_version
  memory_size_gb     = var.memorystore_size_gb
  reserved_ip_range  = var.memorystore_ip_range
  authorized_network = data.terraform_remote_state.vpc.outputs.vpc_link
}

resource "random_id" "memorystore-name-suffix" {
  byte_length = 4
}

resource "google_redis_instance" "memorystore-redis" {
  name = "${var.env_name}-memorystore-${random_id.memorystore-name-suffix.hex}"

  region = var.region

  tier               = var.memorystore_tier
  redis_version      = var.memorystore_version
  memory_size_gb     = var.memorystore_size_gb
  reserved_ip_range  = var.memorystore_ip_range
  authorized_network = data.terraform_remote_state.vpc.outputs.vpc_link
}

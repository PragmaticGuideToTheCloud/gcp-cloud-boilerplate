
output "memorystore_host" {
  value = google_redis_instance.memorystore-redis.host
}

output "memorystore_port" {
  value = google_redis_instance.memorystore-redis.port
}

# vim:ts=2:sw=2:et:syn=terraform:

output "memorystore_host" {
  value = google_redis_instance.memorystore-redis.host
}

output "memorystore_port" {
  value = google_redis_instance.memorystore-redis.port
}

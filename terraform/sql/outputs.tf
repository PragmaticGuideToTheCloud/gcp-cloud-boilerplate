output "database_link" {
  value = google_sql_database_instance.sql.self_link
}

output "database_host" {
  value = google_sql_database_instance.sql.private_ip_address
}

output "database_user" {
  value = google_sql_user.sql_user.name
}

output "database_password" {
  value = google_sql_user.sql_user.password
  sensitive = true
}

output "database_name" {
  value = google_sql_database.db.name
}

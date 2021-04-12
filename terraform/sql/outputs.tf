output "database_link" {
  value = google_sql_database_instance.sql.self_link
}

output "database_host" {
  value = google_sql_database_instance.sql.private_ip_address
}

output "database_user" {
  value = google_sql_user.sql-user.name
}

output "database_password" {
  value = google_sql_user.sql-user.password
}

output "database_name" {
  value = google_sql_database.sql.name
}

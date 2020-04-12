
resource "random_id" "database-name-suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "sql" {
  name = "${var.env_name}-database-${random_id.database-name-suffix.hex}"

  region = var.region

  database_version = var.database_version

  settings {
    tier = var.database_tier

    availability_type = "ZONAL"

    ip_configuration {
      ipv4_enabled    = false
      require_ssl     = false
      private_network = data.terraform_remote_state.vpc.outputs.vpc_link
    }

    backup_configuration {
      enabled            = false
      binary_log_enabled = false
    }
  }
}

resource "google_sql_user" "sql-root" {
  name     = "root"
  host     = "%"
  password = var.database_root_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_user" "sql-user" {
  name     = var.database_user
  host     = "%"
  password = var.database_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_database" "sql" {
  name      = var.database_name
  charset   = "utf8"
  collation = "utf8_general_ci"
  instance  = google_sql_database_instance.sql.name
}

# vim:ts=2:sw=2:et:syn=terraform:

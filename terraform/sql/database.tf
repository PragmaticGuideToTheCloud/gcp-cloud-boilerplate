resource "random_string" "randstr" {
  length  = 8
  special = false
  upper   = false
}

resource "google_sql_database_instance" "sql" {
  name = "${var.vpc_name}-${var.env_name}-database-${random_string.randstr}"

  region = var.region

  database_version = var.database_version
  deletion_protection = var.deletion_protection

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

resource "google_sql_user" "sql_root" {
  name     = "root"
  host     = "%"
  password = var.database_root_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_user" "sql_user" {
  name     = var.database_user
  host     = "%"
  password = var.database_password
  instance = google_sql_database_instance.sql.name
}

resource "google_sql_database" "db" {
  name      = var.database_name
  charset   = "utf8"
  instance  = google_sql_database_instance.sql.name
}

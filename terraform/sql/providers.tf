# the latest provider, 3.78.0, contains a bug
# that prevents cration of SQL user accounts
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.77.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

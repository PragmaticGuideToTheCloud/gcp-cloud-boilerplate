terraform {
  required_version = "1.1.7"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.11.0"
    }
  }
}

provider "acme" {
  server_url = var.acme_server_url
}

provider "google" {
  region  = var.region
  project = var.project
}

provider "tls" {}

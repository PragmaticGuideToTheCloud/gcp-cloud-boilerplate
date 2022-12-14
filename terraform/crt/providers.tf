terraform {
  required_version = ">=1.1.7"

  required_providers {
    acme   = {
      source = "terraform-providers/acme"
    }
    google = {
      source  = "hashicorp/google"
      version = "4.11.0"
    }
    tls    = {
      source = "hashicorp/tls"
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

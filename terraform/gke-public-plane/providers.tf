terraform {
  required_version = "1.1.7"

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.11.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.8.0"
    }
  }
}

provider "google" {
  region  = var.region
  project = var.project
}

data "google_client_config" "gke" {}

provider "kubernetes" {
  host                   = google_container_cluster.gke.endpoint
  token                  = data.google_client_config.gke.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.gke.master_auth.0.cluster_ca_certificate)
}

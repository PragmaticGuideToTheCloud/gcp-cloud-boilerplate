provider "google" {
  region  = var.region
  project = var.project
}

data "google_client_config" "gke" {}

provider "kubernetes" {
  load_config_file       = false
  host                   = google_container_cluster.gke.endpoint
  token                  = data.google_client_config.gke.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.gke.master_auth.0.cluster_ca_certificate)
}

provider "local" {}

provider "null" {}

provider "template" {}

provider "terraform" {}

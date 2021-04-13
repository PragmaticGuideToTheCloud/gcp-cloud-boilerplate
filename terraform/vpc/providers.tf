provider "google" {
  region  = var.region
  project = var.project
}

provider "local" {}

provider "null" {}

provider "random" {}

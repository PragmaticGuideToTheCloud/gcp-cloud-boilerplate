provider "google" {
  region  = var.region
  project = var.project
}

provider "random" {}

provider "terraform" {}

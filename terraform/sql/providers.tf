
provider "google" {
  region  = var.region
  project = var.project
}

provider "random" {}

provider "terraform" {}

# vim:ts=2:sw=2:et:syn=terraform:

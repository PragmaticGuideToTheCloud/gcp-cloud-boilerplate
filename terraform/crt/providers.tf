
provider "acme" {
  server_url = var.acme_server_url
}

provider "google" {
  region  = var.region
  project = var.project
}

provider "tls" {}

# vim:ts=2:sw=2:et:syn=terraform:

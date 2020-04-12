
terraform {
  backend "gcs" {}
}

data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config = {
    bucket = "${var.project}-tfstate"
    prefix = "vpc/${var.vpc_name}"
  }
}

# vim:ts=2:sw=2:et:syn=terraform:

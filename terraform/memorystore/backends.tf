data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config = {
    bucket = "${var.project}-tfstate"
    prefix = "vpc/${var.vpc_name}"
  }
}

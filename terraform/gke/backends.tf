data "terraform_remote_state" "vpc" {
  backend = "gcs"
  config  = {
    bucket = "${var.project}-${var.state_bucket_suffix}"
    prefix = "vpc"
  }
}

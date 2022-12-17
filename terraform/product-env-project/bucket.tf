resource "google_storage_bucket" "tfstatebucket" {
  project       = module.project.project_id
  name          = "${module.project.project_id}-tfstate"
  location      = var.region
  force_destroy = true
  labels        = {}

  uniform_bucket_level_access = true

  versioning {
    enabled = false
  }
}

output "tf_state_bucket" {
  value = google_storage_bucket.tfstatebucket.id
}

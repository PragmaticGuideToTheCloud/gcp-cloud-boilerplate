module "project" {
  source                  = "terraform-google-modules/project-factory/google"
  version                 = ">= 13.0.0"
  random_project_id       = true
  name                    = var.project_name
  org_id                  = var.org_id
  billing_account         = var.billing_account
  folder_id               = var.parent_folder_id
  default_service_account = "keep"

  activate_apis = [
    "storage-api.googleapis.com",
    "storage.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "containerregistry.googleapis.com",
    "servicenetworking.googleapis.com",
    "redis.googleapis.com",
  ]
  labels = {}
}

output "prj" {
  value = module.project.project_id
}

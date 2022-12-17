variable "org_id" {
  type = string
}

variable "billing_account" {
  type = string
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "project_name" {
  type = string
}

variable "parent_folder_id" {
  type = string
}

variable "terraform_service_account" {
  type = string
}

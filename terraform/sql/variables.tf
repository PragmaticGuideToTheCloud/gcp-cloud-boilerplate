variable "project" {
  type = string
}

variable "state_bucket_suffix" {
  type    = string
  default = "tfstate"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "zone" {
  type    = string
  default = "europe-west1-b"
}

variable "vpc_name" {
  type        = string
  description = "name of the vpc, e.g. `dev` or `prod`"
}

variable "env_name" {
  type        = string
  description = "name of the gke environment, e.g. `dev1` or `prod1`"
}

variable "deletion_protection" {
  type    = bool
  default = false
}

variable "database_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "database_version" {
  type    = string
  default = "POSTGRES_13"
}

variable "database_root_password" {
  type    = string
  default = "thisIsA123PASS"
}

variable "database_user" {
  type    = string
  default = "apiuser"
}

variable "database_password" {
  type    = string
  default = "SecretPassword123!"
}

variable "database_name" {
  type    = string
  default = "apidb"
}

variable "region" {
  type = string
}

variable "zone" {
  type = string
}

variable "project" {
  type = string
}

variable "env_name" {
  type = string
  description = "name of the gke environment, e.g. `dev1` or `prod1`"
}

variable "vpc_name" {
  type = string
  description = "name of the vpc, e.g. `dev` or `prod`"
}

variable "database_version" {
  type = string
  default = "MYSQL_5_7"
}

variable "database_tier" {
  type = string
  default = "db-f1-micro"
}

variable "database_root_password" {
  type = string
}

variable "database_user" {
  type = string
}

variable "database_password" {
  type = string
}

variable "database_name" {
  type = string
}

# vim:ts=2:sw=2:et:syn=terraform:

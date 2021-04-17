variable "project" {
  type = string
}

variable "state_bucket_suffix" {
  type = string
  default = "tfstate"
}

variable "region" {
  type = string
}

variable "zone" {
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

variable "memorystore_ip_range" {
  type = string
  default = "10.100.69.0/29"
}

variable "memorystore_size_gb" {
  type = string
}

variable "memorystore_tier" {
  type = string
  default = "BASIC"
}

variable "memorystore_version" {
  type = string
  default = "REDIS_4_0"
}

variable "memorystore_name" {
  type = string
}

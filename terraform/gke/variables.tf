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

variable "master_ipv4_cidr_block" {
  type = string
}

variable "compute_preemptible" {
  type = string
  default = true
  description = "https://cloud.google.com/kubernetes-engine/docs/how-to/preemptible-vms"
}

variable "compute_machine_type" {
  type = string
  default = "g1-small"
}

variable "compute_disk_size_gb" {
  type = string
  default = 12
}

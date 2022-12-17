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

variable "datapath_provider" {
  type    = string
  default = "ADVANCED_DATAPATH"
}

variable "master_ipv4_cidr_block" {
  type    = string
  default = "10.132.16.0/28"
}

variable "cidr_block" {
  type    = string
  default = "10.132.0.0/20"
}

variable "vpc_name" {
  type        = string
  description = "name of the vpc, e.g. `dev` or `prod`"
}

variable "env_name" {
  type        = string
  description = "name of the gke cluster, e.g. `dev1` or `prod1`"
}

variable "initial_node_count" {
  type        = string
  default     = 1
  description = "initial number of compute nodes"
}

variable "min_node_count" {
  type        = string
  default     = 1
  description = "minimal number of compute nodes (autoscaling)"
}

variable "max_node_count" {
  type        = string
  default     = 1
  description = "maximal number of compute nodes (autoscaling)"
}

variable "compute_preemptible" {
  type        = string
  default     = true
  description = "https://cloud.google.com/kubernetes-engine/docs/how-to/preemptible-vms"
}

variable "compute_machine_type" {
  type    = string
  default = "n1-standard-2"
}

variable "compute_image_type" {
  type        = string
  default     = "cos_containerd"
  description = "https://cloud.google.com/kubernetes-engine/docs/concepts/node-images"
}

variable "compute_disk_size_gb" {
  type    = string
  default = 12
}

variable "gke_oauth_scopes" {
  type = list(string)
  default = [
    "storage-ro",
    "logging-write",
    "monitoring",
  ]
}

variable "authorized_networks" {
  type = list(any)
  default = [
    {
      display_name : "Anywhere",
      cidr_block : "0.0.0.0/0"
    },
  ]
}

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

variable "peer_routes" {
  type    = string
  default = "10.2.0.0/16"
}

variable "vpc_name" {
  type        = string
  description = "name of the VPC, e.g. `dev` or `prod`"
}

variable "vpc_prefix_length" {
  type    = string
  default = "24"
}

variable "vpc_auto_create_subnetworks" {
  type    = bool
  default = false
}

variable "subnet_name" {
  type    = string
  default = "subnet"
}

variable "subnet_ip_cidr_range" {
  type    = string
  default = "10.2.0.0/24"
}

variable "subnet_region" {
  type    = string
  default = "europe-west1"
}

variable "firewall_name" {
  type    = string
  default = "firewall_subnet"
}

variable "bastion_count" {
  type    = number
  default = 1
  validation {
    condition     = (var.bastion_count >= 0 && var.bastion_count <= 1)
    error_message = "Number of bastion nodes must be 0 or 1."
  }
}

variable "nat_count" {
  type    = number
  default = 1
  validation {
    condition     = (var.nat_count >= 0 && var.nat_count <= 1)
    error_message = "Number of NATs must be 0 or 1."
  }
}

variable "snc_count" {
  type    = number
  default = 1
  validation {
    condition     = (var.snc_count >= 0 && var.snc_count <= 1)
    error_message = "Number of SNCs must be 0 or 1."
  }
}

variable "bastion_machine_type" {
  type    = string
  default = "f1-micro"
}

variable "bastion_boot_disk_image" {
  type    = string
  default = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"
}

variable "bastion_public_key_filename" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "bastion_user" {
  type    = string
  default = "ubuntu"
}

variable "bastion_port" {
  type    = string
  default = "22"
}

variable "wireguard_port" {
  type    = string
  default = "1691"
}


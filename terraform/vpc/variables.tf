variable "project" {
  type = string
}

variable "region" {
  type = string
  default = "europe-west1"
}

variable "vpc_name" {
  type = string
  description = "name of the VPC, e.g. `dev` or `prod`"
}

variable "vpc_prefix_length" {
  type = string
  default = "20"
}

variable "bastion_count" {
  type = string
  default = 1
  description = "anything >0 will be capped by 1"
}

variable "bastion_machine_type" {
  type = string
  default = "f1-micro"
}

variable "bastion_boot_disk_image" {
  type = string
  default = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"
}

variable "bastion_public_key" {
  type = string
  default = file("~/.ssh/id_rsa.pub")
}

variable "bastion_user" {
  type = string
  default = "ubuntu"
}

variable "bastion_port" {
  type = string
  default = "22"
}

variable "wireguard_port" {
  type = string
  default = "1691"
}


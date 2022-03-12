variable "project" {
  type = string
}

variable "gsa_name" {
  type = string
}

variable "gsa_display_name" {
  type = string
}

variable "role_id" {
  type = string
}

variable "role_title" {
  type = string
}

variable "role_description" {
  type = string
}

variable "role_permissions" {
  type    = list(string)
  default = []
}


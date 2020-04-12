
variable "region" {
  type = string
}

variable "project" {
  type = string
}

variable "crt_name" {
  type = string
}

variable "ovh_application_key" {
  type = string
}

variable "ovh_dns_zone" {
  type = string
}

variable "ovh_endpoint" {
  type = string
}

variable "ovh_application_secret" {
  type = string
}

variable "ovh_consumer_key" {
  type = string
}

variable "acme_server_url" {
  type = string
}

variable "acme_email_address" {
  type = string
}

variable "nameservers" {
  type = list(string)
  default = [
    "dns108.ovh.net:53",
    "ns108.ovh.net:53",
  ]
}

# vim:ts=2:sw=2:et:syn=terraform:

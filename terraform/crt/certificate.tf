resource "tls_private_key" "foobar_crt_gcp" {
  algorithm = "RSA"
}

resource "acme_registration" "foobar_crt_gcp" {
  account_key_pem = tls_private_key.foobar_crt_gcp.private_key_pem
  email_address   = var.acme_email_address
}

resource "acme_certificate" "foobar_crt_gcp" {
  account_key_pem = acme_registration.foobar_crt_gcp.account_key_pem
  common_name     = "*.${var.ovh_dns_zone}"

  recursive_nameservers = var.nameservers

  dns_challenge {
    provider = "ovh"

    config = {
      OVH_ENDPOINT           = var.ovh_endpoint
      OVH_APPLICATION_KEY    = var.ovh_application_key
      OVH_APPLICATION_SECRET = var.ovh_application_secret
      OVH_CONSUMER_KEY       = var.ovh_consumer_key
    }
  }
}

resource "google_compute_ssl_certificate" "foobar_crt_gcp" {
  name = var.crt_name

  private_key = acme_certificate.foobar_crt_gcp.private_key_pem
  certificate = "${acme_certificate.foobar_crt_gcp.certificate_pem}${acme_certificate.foobar_crt_gcp.issuer_pem}"

  lifecycle {
    create_before_destroy = true
  }
}

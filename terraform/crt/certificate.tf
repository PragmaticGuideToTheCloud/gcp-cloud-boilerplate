
resource "tls_private_key" "aiqa-crt-gcp" {
  algorithm = "RSA"
}

resource "acme_registration" "aiqa-crt-gcp" {
  account_key_pem = tls_private_key.aiqa-crt-gcp.private_key_pem
  email_address   = var.acme_email_address
}

resource "acme_certificate" "aiqa-crt-gcp" {
  account_key_pem = acme_registration.aiqa-crt-gcp.account_key_pem
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

resource "google_compute_ssl_certificate" "aiqa-crt-gcp" {
  name = var.crt_name

  private_key = acme_certificate.aiqa-crt-gcp.private_key_pem
  certificate = "${acme_certificate.aiqa-crt-gcp.certificate_pem}${acme_certificate.aiqa-crt-gcp.issuer_pem}"

  lifecycle {
    create_before_destroy = true
  }
}

# vim:ts=2:sw=2:et:syn=terraform:
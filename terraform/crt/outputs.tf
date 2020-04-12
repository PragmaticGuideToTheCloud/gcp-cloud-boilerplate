
output "certificate_link" {
  value = google_compute_ssl_certificate.aiqa-crt-gcp.self_link
}

output "certificate_id" {
  value = google_compute_ssl_certificate.aiqa-crt-gcp.certificate_id
}

# vim:ts=2:sw=2:et:syn=terraform:

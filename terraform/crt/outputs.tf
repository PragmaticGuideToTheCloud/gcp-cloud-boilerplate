output "certificate_link" {
  value = google_compute_ssl_certificate.foobar_crt_gcp.self_link
}

output "certificate_id" {
  value = google_compute_ssl_certificate.foobar_crt_gcp.certificate_id
}

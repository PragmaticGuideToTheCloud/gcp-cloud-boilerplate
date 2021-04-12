resource "google_service_account" "gke" {
  project    = var.project
  account_id = "${var.env_name}-account"
}

resource "google_project_iam_member" "gke" {
  project = google_service_account.gke.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke.email}"
}

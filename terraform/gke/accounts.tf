resource "google_service_account" "gke" {
  project    = var.project
  account_id = "${var.vpc_name}-${var.env_name}-gke-account"
}

resource "google_project_iam_member" "gke_storage_object_viewer" {
  project = google_service_account.gke.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.gke.email}"
}

resource "google_service_account" "gsa" {
  account_id   = var.gsa_name
  display_name = var.gsa_display_name
}

resource "google_project_iam_custom_role" "custom_role" {
  role_id     = var.role_id
  title       = var.role_title
  description = var.role_description
  permissions = var.role_permissions
}

# What permissions does service account have in the project?
resource "google_project_iam_member" "gcr_cleaner_project_iam" {

  depends_on = [
    google_service_account.gsa,
    google_project_iam_custom_role.custom_role
  ]

  project = var.project
  role    = google_project_iam_custom_role.custom_role.name
  member  = "serviceAccount:${google_service_account.gsa.email}"
}

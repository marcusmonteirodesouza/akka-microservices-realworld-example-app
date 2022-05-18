resource "google_project" "realworld" {
  name                = "${var.project_id}-${var.environment}"
  project_id          = "${var.project_id}-${var.environment}"
  org_id              = var.org_id
  billing_account     = var.billing_account
  auto_create_network = false
}

resource "google_storage_bucket" "tfstate" {
  project       = google_project.realworld.project_id
  name          = "tfstate-${var.project_id}-${var.environment}"
  location      = var.region
  force_destroy = true
  versioning {
    enabled = true
  }
}

resource "google_project_service" "storage" {
  project = var.project
  service = "storage.googleapis.com"
}

resource "google_storage_bucket" "this" {
  project                     = var.project
  name                        = var.name
  location                    = var.location
  force_destroy               = var.force_destroy
  storage_class               = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access

  versioning {
    enabled = var.versioning
  }

  depends_on = [google_project_service.storage]
}

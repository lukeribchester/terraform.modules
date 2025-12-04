resource "google_project_service" "run" {
  project = var.project
  service = "run.googleapis.com"
}

resource "google_service_account" "run" {
  account_id   = var.service_account_id
  display_name = var.service_account_id
  project      = var.project
}

resource "google_cloud_run_v2_service" "this" {
  name                 = var.name
  location             = var.location
  deletion_protection  = var.deletion_protection
  ingress              = var.ingress
  invoker_iam_disabled = true
  project              = var.project

  scaling {
    min_instance_count = var.min_instance_count
    max_instance_count = var.max_instance_count
  }

  template {
    max_instance_request_concurrency = var.max_instance_request_concurrency
    service_account                  = google_service_account.run.email

    containers {
      image = var.image
    }
  }

  lifecycle {
    ignore_changes = [
      client,
      client_version,
      template[0].containers[0].image,
      template[0].labels
    ]
  }
}

resource "google_cloud_run_domain_mapping" "this" {
  for_each = var.domains

  name     = each.value
  location = var.location
  project  = var.project

  metadata {
    namespace = var.project
  }

  spec {
    route_name = google_cloud_run_v2_service.this.name
  }
}

resource "google_cloud_run_v2_service_iam_member" "developer" {
  for_each = var.developers

  project  = google_cloud_run_v2_service.this.project
  location = google_cloud_run_v2_service.this.location
  name     = google_cloud_run_v2_service.this.name
  role     = "roles/run.developer"
  member   = each.value
}

resource "google_service_account_iam_member" "service_account_user" {
  for_each = var.service_account_users

  service_account_id = google_service_account.run.name
  role               = "roles/iam.serviceAccountUser"
  member             = each.value
}

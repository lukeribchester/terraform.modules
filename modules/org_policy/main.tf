resource "google_project_service" "org_policy" {
  project = var.project
  service = "orgpolicy.googleapis.com"
}

resource "google_org_policy_policy" "this" {
  name   = "${var.parent}/policies/${var.name}"
  parent = var.parent

  spec {
    rules {
      enforce = var.enforce
    }
  }

  depends_on = [google_project_service.org_policy]
}

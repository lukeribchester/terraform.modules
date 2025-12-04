resource "google_iam_workload_identity_pool" "this" {
  project                   = var.project
  workload_identity_pool_id = var.workload_identity_pool_id
}

resource "google_iam_workload_identity_pool_provider" "this" {
  project                            = var.project
  workload_identity_pool_id          = google_iam_workload_identity_pool.this.workload_identity_pool_id
  workload_identity_pool_provider_id = var.workload_identity_pool_provider_id
  disabled                           = var.disabled
  attribute_condition                = var.attribute_condition
  attribute_mapping                  = var.attribute_mapping

  oidc {
    issuer_uri = var.issuer_uri
  }
}

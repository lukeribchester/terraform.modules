resource "google_project_service" "compute" {
  project = var.project
  service = "compute.googleapis.com"
}

resource "google_project_service" "service_networking" {
  project = var.project
  service = "servicenetworking.googleapis.com"
}

resource "google_compute_network" "this" {
  project                 = var.project
  name                    = var.name
  auto_create_subnetworks = false

  depends_on = [google_project_service.compute]
}

resource "google_compute_subnetwork" "this" {
  for_each = var.subnets

  project       = var.project
  name          = "${var.name}-subnet-${each.value.region}"
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = google_compute_network.this.id
}

resource "google_compute_global_address" "this" {
  project       = var.project
  name          = "google-managed-services-${var.name}"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  address       = var.psa_address
  prefix_length = var.psa_prefix_length
  network       = google_compute_network.this.id
}

resource "google_service_networking_connection" "this" {
  network                 = google_compute_network.this.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.this.name]

  depends_on = [google_project_service.service_networking]
}

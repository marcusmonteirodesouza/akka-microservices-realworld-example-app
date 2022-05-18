provider "google" {
  project = var.project_id
}

resource "google_compute_network" "vpc_network" {
  name                            = "vpc-network"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "subnetworks" {
  for_each      = var.subnetworks
  name          = each.value.name
  region        = each.value.region
  ip_cidr_range = each.value.ip_cidr_range
  network       = google_compute_network.vpc_network.id
}

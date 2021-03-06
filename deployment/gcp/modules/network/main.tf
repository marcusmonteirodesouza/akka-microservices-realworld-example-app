provider "google" {
  project = var.project_id
}

resource "google_compute_network" "vpc_network" {
  name                            = "vpc-network"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_route" "default_internet_gateway" {
  name             = "default-internet-gateway"
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc_network.name
  next_hop_gateway = "default-internet-gateway"
}

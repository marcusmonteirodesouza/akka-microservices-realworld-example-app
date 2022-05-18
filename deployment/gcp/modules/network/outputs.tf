output "network" {
  value = google_compute_network.vpc_network
}

output "subnetworks" {
  value = google_compute_subnetwork.subnetworks
}

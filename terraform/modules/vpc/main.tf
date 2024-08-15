resource "google_compute_network" "vpc_network" {  
  name                    = "gke-vpc-network"  
  auto_create_subnetworks = "false"  
}  

resource "google_compute_subnetwork" "subnetwork" {  
  name          = "gke-subnetwork"  
  ip_cidr_range = "10.0.0.0/24"  
  region        = "us-central1"  
  network       = google_compute_network.vpc_network.name  
}
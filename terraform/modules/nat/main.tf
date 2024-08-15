resource "google_compute_router" "nat_router" {  
  name    = "nat-router"  
  region  = "us-central1"  
  network = var.network_id  
}  

resource "google_compute_router_nat" "nat_gateway" {  
  name   = "nat-gateway"  
  router = google_compute_router.nat_router.name  

  nat_ip_allocate_option = "AUTO_ONLY"  
  region = "us-central1"  

  log_config {  
    enable = true  
  }  
}
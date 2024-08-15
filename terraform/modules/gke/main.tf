resource "google_container_cluster" "primary" {  
  name     = "gke-cluster"  
  location = "us-central1"  

  main_version = "1.24.8-gke.1000"  

  initial_node_count = 3  

  remove_default_node_pool = true  

  node_pool {  
    name       = "default-pool"  
    node_count = 3  

    node_config {  
      machine_type = "e2-medium"  

      oauth_scopes = [  
        "https://www.googleapis.com/auth/cloud-platform",  
      ]  

      metadata = {  
        "gci-update-strategy" = "upgrade"  
      }  

      tags = ["gke-cluster"]  
    }  
  }  

  network    = var.network_id  
  subnetwork = "gke-subnetwork"  
}
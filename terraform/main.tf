provider "google" {  
  credentials = file(var.credentials_file)  
  project     = var.project_id  
  region      = "us-central1"  
} 

module "vpc" {  
  source             = "./modules/vpc"  
  network_name      = "time-api-vpc"  
  subnetwork_name   = "time-api-subnet"  
  cidr_range        = "10.0.0.0/16"  
  region            = "us-central1"  
}  

module "gke" {  
  source       = "./modules/gke"  
  cluster_name = "time-api-cluster"  
  location     = "us-central1"  
  machine_type = "n1-standard-1"  

  node_pools = {  
    default = 3  
  }  
}  

module "nat" {  
  source            = "./modules/nat"  
  router_name       = "time-api-router"  
  nat_name          = "time-api-nat"  
  nat_ip_address    = "<YOUR_NAT_IP_ADDRESS>"  
  region            = "us-central1"  
  network_id        = module.vpc.network_id  
}
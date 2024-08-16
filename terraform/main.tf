provider "google" {  
  project = var.project_id  
  region  = var.region  
}  

resource "google_artifact_registry_repository" "docker_repo" {  
  repository_id   = "gcp-time-api-repo"  
  location        = var.region  
  repository_format = "docker"  
  description      = "Docker repository"  
}  

resource "google_container_cluster" "gke_cluster" {  
  name     = "gcp-time-api-cluster"  
  location = var.region  

  initial_node_count = 1  
  remove_default_node_pool = true  

  node_pool {  
    name       = "default-pool"  
    node_count = 1  
    node_config {  
      machine_type = "e2-medium"  
      oauth_scopes = [  
        "https://www.googleapis.com/auth/cloud-platform"  
      ]  
    }  
  }  
}  

resource "kubernetes_deployment" "app_deployment" {  
  metadata {  
    name      = "gcp-time-api"  
    namespace = "default"  
  }  
  spec {  
    replicas = 1  
    selector {  
      match_labels = {  
        app = "gcp-time-api"  
      }  
    }  
    template {  
      metadata {  
        labels = {  
          app = "gcp-time-api"  
        }  
      }  
      spec {  
        container {  
          name  = "gcp-time-api"  
          image = "us-central1-docker.pkg.dev/${var.project_id}/gcp-time-api-repo/gcp-time-api:latest"  
          ports {  
            container_port = 8080  
          }  
        }  
      }  
    }  
  }  
}  

resource "kubernetes_service" "app_service" {  
  metadata {  
    name      = "gcp-time-api"  
    namespace = "default"  
  }  
  spec {  
    type = "LoadBalancer"  
    port {  
      port        = 80  
      target_port = 8080  
    }  
    selector = {  
      app = "gcp-time-api"  
    }  
  }  
}
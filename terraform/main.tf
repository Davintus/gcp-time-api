provider "google" {  
  credentials = file(var.credentials_file)  # Use the GitHub Secrets for GCP credentials  
  project     = var.project_id  
  region      = var.region  
}  

resource "google_project_service" "artifact_registry" {  
  project = var.project_id  
  service = "artifactregistry.googleapis.com"  
}  

resource "google_project_service" "cloud_build" {  
  project = var.project_id  
  service = "cloudbuild.googleapis.com"  
}  

resource "google_project_service" "gke" {  
  project = var.project_id  
  service = "container.googleapis.com"  
}  

resource "google_artifact_registry_repository" "docker_repo" {  
  provider = google-beta  
  repository_id = var.repository_id  
  project  = var.project_id  
  format   = "DOCKER"  
  location = var.region  
  description = "Docker repository"  
}  

resource "google_container_cluster" "gke_cluster" {  
  name     = var.cluster_name  
  location = var.region  
  initial_node_count = 1  

  # Enable Autopilot for simpler server configuration  
  autopilot {}  
}
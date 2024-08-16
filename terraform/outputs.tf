output "artifact_registry" {  
  value = google_artifact_registry_repository.docker_repo.id  
}  

output "gke_cluster_name" {  
  value = google_container_cluster.gke_cluster.name  
}
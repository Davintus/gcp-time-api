# outputs.tf
output "gke_cluster_name" {
  value = google_container_cluster.primary.name
}

output "api_endpoint" {
  value = kubernetes_service.api_service.status[0].load_balancer[0].ingress[0].ip
}

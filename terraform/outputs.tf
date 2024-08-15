output "k8s_cluster_endpoint" {  
  value = module.gke.endpoint  
}  

output "vpc_network_id" {  
  value = module.vpc.network_id  
}  

output "nat_gateway_id" {  
  value = module.nat.nat_gateway_id  
}
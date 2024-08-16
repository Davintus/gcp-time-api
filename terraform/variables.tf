variable "project_id" {}  
variable "region" {  
  default = "us-central1"  
}  
variable "repository_id" {  
  default = "gcp-time-api-repo"  
}  
variable "cluster_name" {  
  default = "gcp-time-api-cluster"  
}  
variable "credentials_file" {  
  default = "\gcp-time-api\gcp_credentials.json"
}
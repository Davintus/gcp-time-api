variable "credentials_file" {  
  description = "Path to the service account credentials file"  
  type        = string  
  default     = "./credential.json"  # Ensure this line ends with a quote  
}  

variable "project_id" {  
  description = "The GCP project ID"  
  type        = string  
}  

variable "api_image_name" {  
  description = "The Docker image name for the API"  
  type        = string  
  default     = "gcr.io/${var.project_id}/gcp-time-api"  # Correct interpolation  
}
resource "kubernetes_namespace" "api" {  
  metadata {  
    name = "api-namespace"  
  }  
}  

resource "kubernetes_deployment" "api" {  
  metadata {  
    name      = "gcp-time-api"  
    namespace = kubernetes_namespace.api.metadata[0].name  
  }  

  spec {  
    replicas = 3  

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
          image = var.api_image_name  

          port {  
            number = 8080  
          }  
        }  
      }  
    }  
  }  
}  

resource "kubernetes_service" "api" {  
  metadata {  
    name      = "gcp-time-api-service"  
    namespace = kubernetes_namespace.api.metadata[0].name  
  }  

  spec {  
    selector = {  
      app = kubernetes_deployment.api.metadata[0].labels["app"]  
    }  

    port {  
      port        = 80  
      target_port = 8080  
    }  

    type = "LoadBalancer"  
  }  
}  

resource "kubernetes_ingress" "api" {  
  metadata {  
    name      = "gcp-time-api-ingress"  
    namespace = kubernetes_namespace.api.metadata[0].name  
  }  

  spec {  
    backend {  
      service_name = kubernetes_service.api.metadata[0].name  
      service_port = 80  
    }  
  }  
}
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
  }
}

variable "host" {
  type = string
}

variable "client_certificate" {
  type = string
}

variable "client_key" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}

provider "kubernetes" {
  host = var.host

  client_certificate     = base64decode(var.client_certificate)
  client_key             = base64decode(var.client_key)
  cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
}

resource "kubernetes_deployment" "dev" {
  metadata {
    name = "dev-hello"
    labels = {
      App = "DevHello"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "DevHello"
      }
    }
    template {
      metadata {
        labels = {
          App = "DevHello"
        }
      }
      spec {
        container {
          image = "danern/my-dev:1.0"
          name  = "dev-con"

          port {
            container_port = 3000
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "dev-hello" {
  metadata {
    name = "dev-hello"
  }
  spec {
    selector = {
      App = kubernetes_deployment.dev.spec.0.template.0.metadata[0].labels.App
    }
    port {
      node_port   = 30950
      port        = 80
      target_port = 3000
    }

    type = "NodePort"
  }
}
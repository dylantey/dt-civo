terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

# Configure the Civo Provider
provider "civo" {
  region = "NYC1"
  token = var.civo_token
}

# Create a cluster
resource "civo_kubernetes_cluster" "dt-cluster" {
    name = "dt-cluster"
    num_target_nodes = 1
    target_nodes_size = "g4s.kube.xsmall"
}

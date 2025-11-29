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
}

# Retrieve the default firewall
data "civo_firewall" "this" {
  name = "default"
}

# Create a cluster
resource "civo_kubernetes_cluster" "dt-cluster" {
  name               = "dt-cluster"
  firewall_id        = data.civo_firewall.this.id
  kubernetes_version = "1.32.5-k3s1"
  pools {
    size       = "g4s.kube.xsmall"
    node_count = 1
  }
  applications = "kubefirst,sonarqube,kubernetes-dashboard"
}

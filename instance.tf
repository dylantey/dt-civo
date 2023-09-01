terraform {
  required_providers {
    civo = {
      source = "civo/civo"
    }
  }
}

# Configure the Civo Provider
provider "civo" {
  token = var.civo_token
}

# Query instance disk image
data "civo_disk_image" "debian" {
   filter {
        key = "name"
        values = ["debian-10"]
   }
}

# Create a new instance
resource "civo_instance" "test" {
    tags = ["python", "nginx"]
    notes = "this is a note for the server"
    size = "g3.medium"
    disk_image = element(data.civo_disk_image.debian.diskimages, 0).id
}

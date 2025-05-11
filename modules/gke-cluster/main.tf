provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_region
  credentials = file("${path.module}/../../gcp-credentials.json")
}

resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.gcp_region
  remove_default_node_pool = true
  deletion_protection = false

  release_channel {
    channel = "REGULAR"
  }

  node_pool {
    name               = "app-pool"
    initial_node_count = var.node_count

    node_config {
      machine_type = var.machine_type
      disk_size_gb = var.node_disk_size_gb
    }
  }
}

output "cluster_name" {
  value = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluster_location" {
  value = google_container_cluster.primary.location
}

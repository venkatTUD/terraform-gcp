provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  zone        = var.gcp_region
  # Only try to read credentials file if it's provided and exists
  credentials = var.gcp_credentials_file != "" ? (fileexists(var.gcp_credentials_file) ? file(var.gcp_credentials_file) : null) : null
}

resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.gcp_region
  remove_default_node_pool = true
  deletion_protection      = true  # Enable deletion protection

  release_channel {
    channel = "REGULAR"
  }

  # Add lifecycle rules to prevent accidental destruction
  
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "app-pool"
  location   = var.gcp_region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = var.node_disk_size_gb

    # Add metadata to identify nodes
    labels = {
      environment = var.cluster_name
    }

    # Add tags for network access
    tags = ["gke-node", "${var.cluster_name}-node"]
  }

  # Add lifecycle rules to prevent accidental destruction
 
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

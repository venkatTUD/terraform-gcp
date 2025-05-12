# dev/main.tf

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }

  # Add backend configuration if needed
  # backend "gcs" {
  #   bucket = "your-terraform-state-bucket"
  #   prefix = "dev"
  # }
}

provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  credentials = var.gcp_credentials_file != "" ? (fileexists(var.gcp_credentials_file) ? file(var.gcp_credentials_file) : null) : null
}

module "gke" {
  source               = "../modules/gke-cluster"
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  cluster_name         = var.cluster_name
  node_count           = var.node_count
  machine_type         = var.machine_type
  gcp_credentials_file = var.gcp_credentials_file
  # Pass the dev-specific disk size to the module
  node_disk_size_gb    = var.dev_node_disk_size_gb
}

# Output relevant information from the module
output "cluster_name" {
  value = module.gke.cluster_name
}

output "cluster_endpoint" {
  value = module.gke.cluster_endpoint
}

output "cluster_location" {
  value = module.gke.cluster_location
}

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
}
variable "gcp_region" {
  description = "The GCP region"
  type        = string
}
variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}
variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
}
variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
}
variable "node_disk_size_gb" {
  description = "The disk size for the nodes in GB"
  type        = number
}
variable "gcp_credentials_file" {
  description = "Path to GCP credentials file. Leave empty to use application default credentials or environment variables."
  type        = string
  default     = ""
}

# Define the variable for node disk size specific to dev
variable "dev_node_disk_size_gb" {
  description = "Disk size for nodes in the dev environment node pool."
  type        = number
  default     = 25 # Set the desired disk size for dev here (e.g., 25GB)
}
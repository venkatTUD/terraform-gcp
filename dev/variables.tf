variable "gcp_project_id" {
  type = string
}
variable "gcp_region" {
  type = string
}
variable "cluster_name" {
  type = string
}
variable "node_count" {
  type = number
}
variable "machine_type" {
  type = string
}
variable "gcp_credentials_file" {
  type        = string
  description = "Path to GCP credentials file. Leave empty to use application default credentials or environment variables."
  default     = ""
}

# Define the variable for node disk size specific to dev
variable "dev_node_disk_size_gb" {
  description = "Disk size for nodes in the dev environment node pool."
  type        = number
  default     = 25 # Set the desired disk size for dev here (e.g., 25GB)
}
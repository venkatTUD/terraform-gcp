# modules/gke-cluster/variables.tf

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "gcp_project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "The GCP region"
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to GCP credentials file. Leave empty to use application default credentials or environment variables."
  type        = string
  default     = ""
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "machine_type" {
  description = "The machine type for the nodes"
  type        = string
  default     = "e2-small"
}

variable "node_disk_size_gb" {
  description = "The disk size for the nodes in GB"
  type        = number
  default     = 25
}

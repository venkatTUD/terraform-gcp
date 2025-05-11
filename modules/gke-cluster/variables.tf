# modules/gke-cluster/variables.tf

variable "cluster_name" {
  description = "The name of the GKE cluster."
  type        = string
}

variable "gcp_project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "gcp_region" {
  description = "The GCP region for the cluster."
  type        = string
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials JSON file."
  type        = string
  default     = "credentials.json" # Keep default for convenience if file is in root
}

variable "node_count" {
  description = "The initial number of nodes per zone in the node pool."
  type        = number
  default     = 1 # Keep default
}

variable "machine_type" {
  description = "The machine type for the nodes in the node pool."
  type        = string
  default     = "e2-standard-2" # Keep default
}

# Define a new variable for disk size
variable "node_disk_size_gb" {
  description = "The disk size for nodes in the node pool in GB."
  type        = number
  default     = 50 # You can keep a default here, but it will be overridden by the caller
}

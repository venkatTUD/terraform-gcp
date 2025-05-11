module "gke" {
  source               = "../modules/gke-cluster"
  gcp_project_id       = var.gcp_project_id
  gcp_region           = var.gcp_region
  cluster_name         = var.cluster_name
  node_count           = var.node_count
  machine_type         = var.machine_type
  gcp_credentials_file = var.gcp_credentials_file
}

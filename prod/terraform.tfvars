# prod/terraform.tfvars
gcp_project_id       = "eadtud"
gcp_region           = "us-central1"
cluster_name         = "receipt-prod-cluster"
node_count           = 1
machine_type         = "e2-medium"
gcp_credentials_file = "../eadtud-f10bcf889973.json"
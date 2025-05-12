#!/bin/bash

# Initialize Terraform
terraform init

# Import the GKE cluster
terraform import module.gke.google_container_cluster.primary projects/eadtud/locations/us-central1/clusters/receipt-prod-cluster

# Import the node pool
terraform import module.gke.google_container_node_pool.primary_nodes projects/eadtud/locations/us-central1/clusters/receipt-prod-cluster/nodePools/app-pool 
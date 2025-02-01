resource "google_container_cluster" "gke_cluster" {
  name     = "my-gke-cluster"
  location = "us-central1"

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 100
  }

  initial_node_count = 3
}

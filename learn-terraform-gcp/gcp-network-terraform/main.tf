resource "google_compute_network" "auto_vpc_tf" {
  name                     = "auto-vpc-tf"  # Replaced underscores with dashes
  auto_create_subnetworks = true
}

resource "google_compute_network" "custom_vpc_network" {
  name                     = "custom-vpc-network"  # Replaced underscores with dashes
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "sub_name" {
  name          = "sub-name"  # Subnetwork name
  network       = google_compute_network.custom_vpc_network.id  # Reference to the custom VPC
  ip_cidr_range = "10.1.0.0/24"  # Define the CIDR range
  region        = "asia-southeast1"  # Specify the region
  private_ip_google_access = true
}

output "auto" {
  value = google_compute_network.auto_vpc_tf.id
}

output "custom" {
  value = google_compute_network.custom_vpc_network.id
}


# aplying firewall rules.check 
resource "google-compute-firewall" "allow_icmp" {
    name = "allow_icmp"
    auto_create_subnets = false 
    network =google_compute_network.custom_vpc_network-tf.id
    allow {
        protocal = "icmp"

    }
    source_ranges = ["136.226.244.106"]
    priority = 455


  
}
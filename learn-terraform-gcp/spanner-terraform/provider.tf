terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.65" # Specifies the desired version range for the Google provider
    }
  }
}

provider "google" {
  credentials = file("C:/ENV/rathnakar-18m85a0320-hiscox-0d1ad7b79faf.json") # Ensure this path is correct and points to the service account key
  project     = "rathnakar-18m85a0320-hiscox"                                # Replace with your actual GCP project ID
  region      = "us-central1"                                                # Define your preferred region (e.g., us-central1)
  zone        = "us-central1-a"                                              # Define your preferred zone (must match the region)
}

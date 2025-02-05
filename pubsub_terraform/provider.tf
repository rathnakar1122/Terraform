terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # Adjust the version as needed.
    }
  }
}

provider "google" {
  credentials = file("C:/ENV/rathnakar-18m85a0320-hiscox-0d1ad7b79faf.json") # Path to your service account key
  project     = "rathnakar-18m85a0320-hiscox"                                # Your GCP project ID
  region      = "us-central1"                                                # Preferred region
  zone        = "us-central1-a"                                              # Preferred zone
}

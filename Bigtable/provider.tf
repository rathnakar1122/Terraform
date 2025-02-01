provider "google" {
    project = "rathnakar-18m85a0320-hiscox"
    region = "us-central1"
    zone = "us-central1-a"
}


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0" # Upgrade to a recent version (4.x or later).
    }
  }
}


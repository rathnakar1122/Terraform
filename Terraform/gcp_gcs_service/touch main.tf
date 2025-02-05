provider "google" {
  project     = "rathnakar-18m85a0320-hiscox" # Replace with your GCP project ID
  region      = "us"
  credentials = file("C:/ENV/rathnakar-18m85a0320-hiscox-0d1ad7b79faf.json") # Use forward slashes for Windows paths
}

resource "google_storage_bucket" "coldline_bucket" {
  name            = "hiscox-cold" # Replace with your desired bucket name
  location        = "US"
  storage_class   = "COLDLINE"
  force_destroy   = false # Set to true if you want to allow deletion even if objects exist

  versioning {
    enabled = true # Optional: Enable object versioning
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 365 # Optional: Delete objects older than 1 year
    }
  }

  labels = {
    environment = "production" # Replace with appropriate label
    team        = "devops"      # Replace with appropriate label
  }
}

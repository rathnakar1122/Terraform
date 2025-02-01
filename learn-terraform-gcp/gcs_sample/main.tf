provider "google" {
  project     = "rathnakar-18m85a0320-hiscox"  # Replace with your project ID
  region      = "us-central1"
  credentials = file("C:\\ENV\\rathnakar-18m85a0320-hiscox-0d1ad7b79faf.json")  # Correct the path
}

provider "random" {
  version = "~> 3.0"  # Optional: Specify the provider version if needed
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "my_bucket" {
  name                         = "my-unique-bucket-name-${random_id.bucket_suffix.hex}"  # Use random suffix to ensure uniqueness
  location                     = "US" 
  force_destroy                = true 
  project                      = "rathnakar-18m85a0320-hiscox"  # Add your GCP project ID here

  # Optional configurations
  storage_class                = "STANDARD" 
  uniform_bucket_level_access  = true 
  public_access_prevention     = "enforced" 
  requester_pays               = false 

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 30
    }
  }
}

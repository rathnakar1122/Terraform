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

# resource "google_storage_bucket_object" "srcode" {
#   name   = "index.zip"
#   bucket = google_storage_bucket.fun-bucket.name
#   source = "C:/ENV/PREP/learn-terraform-gcp/cloud-function/index.zip"
  
#   provisioner "local-exec" {
#     command = "gsutil cp ${self.source} gs://${google_storage_bucket.fun-bucket.name}/${self.name}"
#   }
# }

provider "google" {
  project     = "rathnakar-18m85a0320-hiscox"
  region      = "us"
  credentials = file("C:/ENV/rathnakar-18m85a0320-hiscox-0d1ad7b79faf.json")
}

# Create new storage bucket in the US
# location with Standard Storage
resource "google_storage_bucket" "static" {
  name          = "jll-gcs-input"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

# Upload a text file as an object
# to the storage bucket
resource "google_storage_bucket_object" "default" {
  name         = "incident"
  source       = "nothing" # Replace with the actual path to your file
  content_type = "text/plain"
  bucket       = google_storage_bucket.static.id
}

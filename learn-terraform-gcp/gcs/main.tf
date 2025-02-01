resource "google_storage_bucket" "dynamic_bucket" {
  name          = "bucket-${formatdate("YYYYMMDD", timestamp())}" # Dynamically include the current date
  project       = "rathnakar-18m85a0320-hiscox"
  storage_class = "NEARLINE"
  location      = "us-central1"

  labels = {
    env   = "tf_env"
    deep  = "compliance"
  }

  uniform_bucket_level_access = true
}

resource "google_storage_bucket_object" "upload_object" {
  name   = "WIN_20240506_18_29_55_Pro.jpg"
  bucket = google_storage_bucket.dynamic_bucket.name # Use dynamic bucket name
  source = "C:/ENV/PREP/learn-terraform-gcp/gcs/WIN_20240506_18_29_55_Pro.jpg"
}

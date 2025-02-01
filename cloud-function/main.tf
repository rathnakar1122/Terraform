resource "random_id" "bucket_suffix" {
  byte_length = 4
}

# Create a Google Cloud Storage bucket
resource "google_storage_bucket" "fun-bucket" {
  name     = "fun_bucket_tf_${random_id.bucket_suffix.hex}"
  location = "US"
}

resource "google_storage_bucket_object" "srcode" {
  name   = "index.zip"
  bucket = google_storage_bucket.fun-bucket.name
  source = "./cloud-function/index.zip"  # Use relative path
}

resource "google_cloudfunctions_function" "fun_from_tf" {
  name                    = "fun_from_tf"
  runtime                 = "nodejs20"
  description             = "This is my first terraform script"
  available_memory_mb     = 128
  source_archive_bucket   = google_storage_bucket.fun-bucket.name
  source_archive_object   = "index.zip"  # Assuming the file is uploaded manually
  trigger_http            = true
  entry_point             = "helloHttptf"
}

# Optional: Set IAM policy binding for the function if needed
resource "google_cloudfunctions_function_iam_member" "function_invoker" {
  project        = google_cloudfunctions_function.fun_from_tf.project
  region         = google_cloudfunctions_function.fun_from_tf.region
  cloud_function = google_cloudfunctions_function.fun_from_tf.name
  role           = "roles/cloudfunctions.invoker"
  member         = "allUsers"  # You can change this to a specific member if required
}


resource "google-google_cloudfunctions_function_iam_member" "allowaccess" {
  region = google_cloudfunctions_function.fun_from_tf.region
  cloud_function = google_cloudfunctions_function.fun_bucket_tf.name
  role = "roles/cloudfunctions.invoker"
  member = allUsers
  
}
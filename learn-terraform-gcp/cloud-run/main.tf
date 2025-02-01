resource "google_cloud_run_service" "run-app-from-tf" {
  name     = "run-app-from-tf"
  location = "asia-southeast1"
  
  template {
    spec {
      containers {
        image = "your-container-image-url"  # Replace with the actual container image URL
      }
    }
  }
}

resource "google_cloud_run_service_iam_binding" "pub-access" {
  service  = google_cloud_run_service.run-app-from-tf.name
  location = google_cloud_run_service.run-app-from-tf.location
  role     = "roles/run.invokers"

  members = [
    "allUsers"  # This allows public access to the Cloud Run service
  ]
}

resource "google_cloud_run_service" "run-app-from-tf" {
  name     = "run-app-from-tf"
  location = "asia-southeast1"
  
  template {
    spec {
      containers {
        image = "your-container-image-url"  # Replace with the actual container image URL
      }
    }
  }
}

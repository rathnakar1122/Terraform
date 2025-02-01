resource "google_spanner_instance" "spanner_instance" {
  name         = "example-instance"
  display_name = "Example Instance"
  config       = "regional-us-central1" # Update to your region
  processing_units = 100  # Serverless Spanner uses this instead of nodes
}


resource "google_spanner_database" "spanner_database" {
  name       = "example-database"
  instance   = google_spanner_instance.spanner_instance.name
  ddl        = [
    "CREATE TABLE Users (UserId STRING(36) NOT NULL, UserName STRING(MAX)) PRIMARY KEY (UserId)"
  ]
}

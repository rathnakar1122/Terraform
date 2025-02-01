resource "google-sql-database-instance" "mysql_from_tf" {
  name               = "mysql-from-tf"
  deletion_protection = false # Fixed typo and aligned with proper syntax
  region             = "us-central1" # Corrected typo in region name
  settings {
    tier = "db-f1-micro"
  }
}

resource "google_sql_user" "myuser" {
  name     = "rathnakar"
  password = "rathnakar@123"
  instance = google_sql_database_instance.mysql_from_tf.name # Correct reference to the database instance
}

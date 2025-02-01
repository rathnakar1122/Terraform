provider "google" {
  project = "rathnakar-18m85a0320-hiscox"
  region  = "us-central1"  # Correct region name
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = "prod"
  project    = "rathnakar-18m85a0320-hiscox"
  location   = "US"  # Correct location
}

resource "google_bigquery_table" "table" {
  table_id   = "sample_table"  # Corrected property name: `table_id` instead of `table`
  dataset_id = google_bigquery_dataset.dataset.dataset_id  # Corrected reference to the dataset
  project    = "rathnakar-18m85a0320-hiscox"

  schema = jsonencode([
    {
      name = "id"
      type = "STRING"
      mode = "REQUIRED"
    },
    {
      name = "name"
      type = "STRING"
      mode = "NULLABLE"
    },
    {
      name = "created_at"
      type = "TIMESTAMP"
      mode = "NULLABLE"
    }
  ])
}

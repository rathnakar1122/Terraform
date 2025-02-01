resource "google_bigquery_dataset" "ds_ds" {
  dataset_id = "ds_from_ts"
}

resource "google_bigquery_table" "table_tf" {
  table_id           = "table_from_tf"
  dataset_id         = google_bigquery_dataset.ds_ds.dataset_id
  deletion_protection = false

  schema = jsonencode([
    {
      "name": "id",
      "type": "STRING",
      "mode": "REQUIRED"
    },
    {
      "name": "name",
      "type": "STRING",
      "mode": "NULLABLE"
    },
    {
      "name": "age",
      "type": "INTEGER",
      "mode": "NULLABLE"
    }
  ])
}

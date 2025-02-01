resource "google-bigtable-instance" "bt-from-tf" {
    name = "bt-from-tf"
    deletion_protection = false 
    labels = {
        "env" = "testing "
        
    }

    cluster = {
        cluster_id = "bt-from-test-1"
        num-nodes  = 1
        storage_type = "SSD"
    }
  
}

resource "google-bigtable-table" "tb1" {
    name = "tb-from-tf"
    instance-name= google-bigtable-instance.bt-from-tf.name
}
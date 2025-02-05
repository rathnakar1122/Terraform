resource "local_sensitive_file" "example" {
  filename = "example.txt"
  content  = "my-secret-content"
  file_permission      = "0700"
}


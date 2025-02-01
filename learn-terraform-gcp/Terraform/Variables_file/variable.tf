variable "filename" {
  type    = string
  default = "my_file.txt"
}

variable "content" {
  type    = string
  default = "Hello, this is a test file created with Terraform!"
}

resource "local_file" "name" {
  filename = var.filename
  content  = var.content
}

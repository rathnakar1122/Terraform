resource "local_file" "name" {
    filename = "explicit.txt"
    content = "this is random string from random provider :${random_string.name2.id}"
    depends_on = [ random_string.name2 ]

}

resource "random_string" "name2" {
  length = 10
}

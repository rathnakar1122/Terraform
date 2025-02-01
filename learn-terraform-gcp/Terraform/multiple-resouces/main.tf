resource "local_file" "cat_res" {
    filename = "cat.txt"
    content  = "i LOve cats"
}

resource "local_file" "dog_res" {
    filename = "dog.txt"
    content  = "i LOve dogs"
}

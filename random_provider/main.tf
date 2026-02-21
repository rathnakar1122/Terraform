resource "random_integer" "rint" {
    min = 80
    max = 200
  
}
resource "random_string" "restring" {
    length = 15

  
}
output "rint1" {
  value = random_integer.rint.result
}

output "rint2" {
  value = random_string.restring.result
}


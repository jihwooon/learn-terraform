variable "names" {
  type    = list(string)
  default = ["a", "c"]
}

resource "local_file" "def" {
  count    = length(var.names)
  filename = "${path.module}/${var.names[count.index]}.txt"
  content  = "Hello ${var.names[count.index]}"
}

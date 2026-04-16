variable "enable_file" {
  default = true
}

resource "local_file" "enable_file" {
  count    = var.enable_file ? 1 : 0
  filename = "${path.module}/enable_file.txt"
  content  = "enable_file"
}

output "enable_file" {
  value = var.enable_file ? local_file.enable_file[0].content : ""
}

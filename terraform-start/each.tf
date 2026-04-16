resource "local_file" "fgh" {
  for_each = {
    a = "content a"
    b = "content b"
  }
  content  = each.value
  filename = "${path.module}/${each.key}.txt"
}

output "each_output" {
  value = local_file.fgh.content
}

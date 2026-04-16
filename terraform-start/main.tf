variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "filename_content" {
  type = string
}

variable "filename" {
  type = string
}

locals {
  content = "${var.filename} ${local.ecr_policy_arn}"
}

output "local" {
  value = local.content
}

output "instance_type" {
  value = var.instance_type
}

resource "local_file" "abc" {
  content  = local.content
  filename = "${path.module}/${var.filename}"
}

output "file_name" {
  value = local_file.abc.id
}

output "file_abspath" {
  value = abspath(local_file.abc.filename)
}

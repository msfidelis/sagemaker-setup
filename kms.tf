resource "aws_kms_key" "main" {
  description             = var.project_name
}
resource "aws_s3_bucket" "notebook" {
  bucket = format("%s-notebook", var.project_name)

  tags = {
    Name    = format("%s-notebook", var.project_name)
  }

}

resource "aws_s3_bucket_versioning" "notebook" {
  bucket = aws_s3_bucket.notebook.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "notebook" {
  bucket = aws_s3_bucket.notebook.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "notebook" {
  bucket = aws_s3_bucket.notebook.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.main.arn
      sse_algorithm     = "aws:kms"
    }
  }
}
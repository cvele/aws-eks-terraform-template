resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = "private"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = { AWS = ["arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.role_name}"] },
        Action    = "s3:*",
        Resource  = "arn:aws:s3:::${var.bucket_name}/*"
      }
    ]
  })
}

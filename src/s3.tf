resource "aws_s3_bucket" "bucket" {
  bucket = "sre-testing-bucket"
  acl    = "private"

  tags = {
    Name        = "my-bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "upload_files" {
  bucket = aws_s3_bucket.bucket.id
  key = var.aws_secret_key

  for_each = fileset("./files/", "*")
  source = "./files/${each.value}"
  etag = filemd5("./files/${each.value}")
}
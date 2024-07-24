resource "aws_s3_bucket" "s3_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = var.s3_force_destroy

  tags = var.s3_bucket_tags
}
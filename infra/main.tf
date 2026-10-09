terraform {
  required_version = ">= 1.0.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo" {
  bucket = "trivy-demo-bucket-12345"
  acl    = "public-read"

  tags = {
    Name = "trivy-demo-bucket"
  }
}

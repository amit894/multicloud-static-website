terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.34.0"
    }
  }
}

provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

resource "aws_s3_bucket" "website" {
  bucket = "${var.prefix}894"
  acl = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket      = aws_s3_bucket.website.bucket
  key         = "index.html"
  source      = "../aws-basic/index.html"
  content_type = "text/html"
  acl         = "public-read"

}

resource "aws_s3_bucket_object" "error" {
  bucket      = aws_s3_bucket.website.bucket
  key         = "error.html"
  source      = "../aws-basic/error.html"
  content_type = "text/html"
  acl         = "public-read"

}

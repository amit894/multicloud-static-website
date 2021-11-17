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

resource "aws_s3_bucket" "website_bucket" {
  bucket = "staticwebsiteacnt894"
  acl = "public-read"
  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket      = aws_s3_bucket.website_bucket.bucket
  key         = "index.html"
  source      = "../aws-basic/index.html"
  content_type = "text/html"
  acl         = "public-read"

}

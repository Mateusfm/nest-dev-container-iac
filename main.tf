terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.8.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "terraform-state" {
  bucket        = "nest-iac-state"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Iac = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform-state" {
  bucket = "nest-iac-state"

  versioning_configuration {
    status = "Enabled"
  }
}
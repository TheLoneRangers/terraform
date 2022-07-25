terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

# ------
# S3 bucket
# ------

resource "aws_s3_bucket" "this_bucket" {
    bucket = "${var.bucket_name}"
}
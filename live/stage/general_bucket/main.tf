provider "aws" {
    region = "us-east-1"
}

terraform {
    backend "s3" {
        bucket = "jh-terraformstate"
        key = "tfstate"
        region = "us-east-1"
    }
}

module "s3_bucket" {
    source = "../../../aws/modules/s3"
    bucket_name = "jh-general-test-bucket1"
}
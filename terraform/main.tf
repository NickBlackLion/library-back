provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-init-files"
    key = "library"
    region = "eu-central-1"
  }
}

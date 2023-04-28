provider "aws" {
  profile = local.aws_profile
  region  = local.aws_region
}

terraform {
  required_version = ">= 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.64.0"
    }

    local = {
      version = "~> 2.4"
    }
  }

  backend "s3" {
  }
}
